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

## 5. Daftar File yang Diperbarui / Dibuat
1. `liquibase/markdown/singkron-struktur-database.md`: Checklist goals diperbarui (`[x]`).
2. `liquibase/markdown/result/singkron-struktur-database.md`: Dokumentasi feedback Plan 1, Plan 2, dan Plan 3.
