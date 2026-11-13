# Feedback & Result: singkron-struktur-database.md (Plan 1)

## 1. Jawaban Plan 1

- **Sinkronisasi Struktur Saja**: **BISA**. Perintah `diff-changelog` Liquibase membandingkan metadata struktur database (tabel, kolom, tipe data, constraint, index), mengabaikan isi data (row data).
- **File Changelog Spesifik**: **PERLU**. Buat file changelog terpisah (misal `changelog/diff-staging-to-ponpesnurulyaqin.mysql.sql`) agar jejak migrasi sinkronisasi antar-database spesifik dan tidak mencemari changelog default.

## 2. Skema & Petunjuk Eksekusi Mandiri

1. **Generate Diff Changelog**:
   ```bash
   cd /root/dev_docker/liquibase
   docker compose run --rm liquibase diff-changelog \
     --reference-url="jdbc:mysql://mysql:3306/masterep_staging?useSSL=false&allowPublicKeyRetrieval=true" \
     --reference-username=root \
     --reference-password=rootMysqlVM2026 \
     --url="jdbc:mysql://mysql:3306/masterep-ponpesnurulyaqin?useSSL=false&allowPublicKeyRetrieval=true" \
     --username=root \
     --password=rootMysqlVM2026 \
     --changelog-file=changelog/diff-staging-to-ponpesnurulyaqin.mysql.sql
   ```
2. **Preview SQL (Dry-Run)**:
   ```bash
   docker compose run --rm liquibase update-sql --changelog-file=changelog/diff-staging-to-ponpesnurulyaqin.mysql.sql
   ```
3. **Eksekusi Update**:
   ```bash
   docker compose run --rm liquibase update --changelog-file=changelog/diff-staging-to-ponpesnurulyaqin.mysql.sql
   ```

## 3. Analisis & Perbaikan Error Plan 2 (`AccessDeniedException`)

### A. Jawaban Kasus Plan 2
- **Status**: **GAGAL / ERROR**. File tidak terbentuk karena terjadi `AccessDeniedException`.
- **Penyebab**: Container Liquibase berjalan sebagai user non-root (`liquibase`, UID 1001), sedangkan folder `./changelog` di host dimiliki oleh `root` dengan permission `755` (`drwxr-xr-x`). Container tidak punya izin tulis (*write permission*) untuk membuat file baru.

### B. Solusi & Perbaikan
1. Berikan izin tulis ke folder changelog di host:
   ```bash
   chmod -R 777 /root/dev_docker/liquibase/changelog
   ```
2. Jalankan ulang perintah CLI `diff-changelog`.

## 4. Perbandingan Format Changelog: `.sql` vs `.xml` (Plan 3)

### A. Perbedaan Utama
| Parameter | Format `.sql` (Formatted SQL) | Format `.xml` (Liquibase XML) |
| :--- | :--- | :--- |
| **Sifat Sintaks** | Native SQL (RDBMS-dependent). | Abstraksi skema RDBMS-agnostic. |
| **Cross-Database** | Tidak (query MySQL tidak bisa langsung jalan di Postgres/Oracle). | Ya (tag XML diterjemahkan otomatis sesuai DBMS target). |
| **Kemudahan Baca/Tulis** | Sangat mudah bagi developer / DBA biasa. | Verbose (panjang dan butuh paham tag XML Liquibase). |
| **Fitur Rollback** | Wajib tulis manual (`-- rollback ...`). | Otomatis di-generate untuk DDL standar (create table, drop table). |
| **Objek Spesifik** | Mendukung stored procedure, trigger, index custom bawaan MySQL. | Terbatas pada tag yang didukung Liquibase (sisanya butuh `<sql>`). |

### B. Mana yang Lebih Baik Digunakan?
- **Gunakan `.sql`**: Jika stack database sudah pasti (hanya MySQL). Paling simpel, tanpa abstraksi berlebih, langsung dieksekusi tanpa overhead.
- **Gunakan `.xml`**: Hanya jika aplikasi harus berjalan di berbagai engine database berbeda (misal migrasi dari MySQL ke PostgreSQL).

## 5. Analisis Target Database Dry-Run (`masterep-annursulsel`) (Plan 4)

### A. Jawaban Kasus Plan 4
- **Pertanyaan**: Kenapa hasil dry-run mengarah ke `masterep-annursulsel`? Apakah karena file `.env`?
- **Jawaban**: **YA, BENAR SEKALI**. Berdasarkan `docker-compose.yml`, service Liquibase membaca file `.env` (`env_file`) yang mendeklarasikan `LIQUIBASE_COMMAND_URL` / `LIQUIBASE_URL` mengarah ke `masterep-annursulsel`. Ketika perintah `update-sql` dijalankan tanpa menyertakan parameter `--url` target secara eksplisit, Liquibase otomatis fallback menggunakan URL database dari environment variable (`.env`).

### B. Solusi / Cara Memperbaiki
Tambahkan parameter `--url`, `--username`, dan `--password` target secara eksplisit pada perintah `update-sql` (atau `update`), atau ubah `.env` ke database target yang diinginkan (`masterep-ponpesnurulyaqin`):
```bash
docker compose run --rm liquibase update-sql \
  --url="jdbc:mysql://mysql:3306/masterep-ponpesnurulyaqin?useSSL=false&allowPublicKeyRetrieval=true" \
  --username=root \
  --password=rootMysqlVM2026 \
  --changelog-file=changelog/diff-staging-to-ponpesnurulyaqin.mysql.sql
```

## 6. Analisis Status & Mekanisme Rollback (`masterep-annursulsel`) (Plan 5)

### A. Status Aktual (Apakah Aman?)
- **AMAN DAN BELUM MASUK**: Perintah yang Anda jalankan sebelumnya adalah **`update-sql`**, bukan `update`. `update-sql` adalah perintah **dry-run** (hanya mencetak preview SQL ke terminal tanpa mengeksekusi apa pun ke database).
- Pengecekan tabel `DATABASECHANGELOG` pada `masterep-annursulsel` membuktikan bahwa tidak ada changelog `diff-staging-to-ponpesnurulyaqin.mysql.sql` yang masuk. Database `masterep-annursulsel` 100% aman dan tidak berubah.

### B. Cara Rollback Jika Terlanjur Menjalankan `update`
Jika suatu saat Anda terlanjur menjalankan perintah `update` (bukan `update-sql`) ke database yang salah, berikut cara penanganannya:
1. **Kekurangan Format SQL Auto-Generate**: File `.sql` hasil `diff-changelog` secara default **tidak memiliki tag `-- rollback`**. Jika tidak ada tag rollback, perintah `liquibase rollback` akan gagal.
2. **Cara Rollback Manual**:
   - **Opsi 1 (Tulis Rollback Manual)**: Tambahkan komentar `-- rollback DROP TABLE ...;` di setiap changeset pada file `.sql`, lalu jalankan:
     ```bash
     docker compose run --rm liquibase rollback-count 1 --changelog-file=...
     ```
   - **Opsi 2 (Drop Objek & Hapus Log)**: Drop tabel/kolom baru secara manual di database via SQL/Navicat, lalu hapus rekamannya dari tabel log Liquibase:
     ```sql
     DELETE FROM DATABASECHANGELOG WHERE FILENAME = 'changelog/diff-staging-to-ponpesnurulyaqin.mysql.sql';
     ```

## 7. Analisis & Perbaikan Kendala 1: `Invalid default value for worksheet_updated_at` (Plan 6)

### A. Ringkasan Penyebab
- **Penyebab**: Definisi kolom pada changeset `1794584573894-153`:
  ```sql
  worksheet_updated_at timestamp(0) DEFAULT null on update CURRENT_TIMESTAMP NOT NULL
  ```
  Di MySQL 8 strict mode, kolom dengan klausul `NOT NULL` **tidak boleh** memiliki `DEFAULT null` (kontradiksi nilai default `NULL` pada kolom yang mewajibkan `NOT NULL`), sehingga MySQL melempar error `1067: Invalid default value`.

### B. Perbaikan
Pada file `liquibase/changelog/changelog/diff-staging-to-ponpesnurulyaqin.mysql.sql` (baris 422), definisi kolom diperbaiki menjadi:
```sql
worksheet_updated_at timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP
```

## 8. Analisis & Perbaikan Kendala 2: `Data truncation: Incorrect date value: '0000-00-00'`

### A. Ringkasan Penyebab
- **Penyebab**: Kolom `bulan_date_pay` pada database target sebelumnya bertipe `VARCHAR(12)` dan menyimpan string `'0000-00-00'`. Saat dieksekusi perintah `ALTER TABLE bulan MODIFY bulan_date_pay date`, MySQL 8 strict mode (`NO_ZERO_DATE` / `NO_ZERO_IN_DATE`) menolak konversi string `'0000-00-00'` menjadi tipe `DATE`.

### B. Solusi
Jalankan query pembersihan data pada database `masterep-ponpesnurulyaqin` untuk mengubah `'0000-00-00'` menjadi `NULL`:
```sql
UPDATE `masterep-ponpesnurulyaqin`.bulan 
SET bulan_date_pay = NULL 
WHERE bulan_date_pay = '0000-00-00';
```
Setelah data dibersihkan, jalankan ulang perintah migrasi `liquibase update`.

## 9. Analisis & Perbaikan Kendala 3: `Data truncation: Incorrect datetime value: '0000-00-00 00:00:00'`

### A. Ringkasan Penyebab
- **Penyebab**: Kolom timestamp seperti `debit_last_update` berisi nilai zero datetime (`'0000-00-00 00:00:00'`). Saat di-alter oleh Liquibase ke tipe `timestamp(0)`, MySQL 8 strict mode menolak konversi zero datetime.

### B. Solusi
Tambahkan konfigurasi `sessionVariables=sql_mode='ERROR_FOR_DIVISION_BY_ZERO'` pada `LIQUIBASE_URL` di dalam file `liquibase/.env` untuk melonggarkan validasi zero-date/zero-datetime pada sesi koneksi migrasi MySQL 8:
```env
LIQUIBASE_URL=jdbc:mysql://mysql:3306/masterep-ponpesnurulyaqin?useSSL=false&allowPublicKeyRetrieval=true&sessionVariables=sql_mode='ERROR_FOR_DIVISION_BY_ZERO'
```
Setelah konfigurasi ini diterapkan, seluruh 319 changeset berhasil dijalankan (`Liquibase: Update has been successful. Rows affected: 102709`).

## 10. Daftar File yang Diperbarui / Dibuat
1. `liquibase/changelog/changelog/diff-staging-to-ponpesnurulyaqin.mysql.sql`: Diperbaiki syntax klausul `worksheet_updated_at` dan `bebas_pay_last_update`.
2. `liquibase/.env`: Ditambahkan parameter `sessionVariables=sql_mode='ERROR_FOR_DIVISION_BY_ZERO'` untuk bypass strict mode zero-date MySQL 8.
3. `liquibase/markdown/singkron-struktur-database.md`: Checklist goals diperbarui (`[x]`).
4. `liquibase/markdown/result/singkron-struktur-database.md`: Dokumentasi feedback lengkap s.d. migrasi sukses.
