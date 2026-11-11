# Feedback & Result: instalasi.md

## 1. Analisis Repositori dan Branch
Repositori `git@github.com:ibnu-sodik/idw-dev-docker-infra.git` merupakan infrastruktur pengembangan berbasis Docker Compose yang terhubung melalui bridge network eksternal `dev_network`.

Struktur branch pada repositori:
- **`master`**: Branch integrasi utama yang menggabungkan seluruh modul infra (`databases`, `webserver`, `odoo`, `sonarqube`, `9router`, `.github`).
- **`databases`**: Service container database MySQL 8.0 dan PostgreSQL (dengan ekstensi `pg_cron`).
- **`webserver`**: Service Nginx dan PHP-FPM (PHP 8.2 dan PHP 8.5).
- **`sonarqube`**: Service SonarQube Community Edition terhubung ke PostgreSQL.
- **`9router`**: Service router `decolua/9router`.
- **`odoo`**: Service ERP Odoo 18.0 beserta custom addons (`muk_web_*`, `om_account_accountant`).
- **`grock-cli`**: Utilitas tunnel Grock CLI.
- **`liquibase`**: Branch untuk manajemen skema database menggunakan Liquibase.

## 2. Instalasi Liquibase
Mengikuti pola arsitektur repositori `idw-dev-docker-infra`, instalasi Liquibase dilakukan menggunakan Docker Compose dan image resmi `liquibase/liquibase:latest` (Versi 5.0.4, OpenJDK 21.0.11) serta CLI wrapper di `/usr/local/bin/liquibase`:
- **Image**: `liquibase/liquibase:latest` (v5.0.4)
- **Konfigurasi Service**: `liquibase/docker-compose.yml` terhubung ke network eksternal `dev_network` dengan volume `./changelog:/liquibase/changelog`.
- **Template Environment**: `liquibase/.env.example` disediakan untuk konfigurasi koneksi database (`LIQUIBASE_URL`, `LIQUIBASE_USER`, `LIQUIBASE_PASSWORD`, `LIQUIBASE_CHANGELOG_FILE`).

## 3. Konfigurasi Gitignore
- **Root `.gitignore`**: Menambahkan whitelist `!/liquibase/` agar direktori `liquibase/` tidak terblokir oleh aturan `/*`.
- **`liquibase/.gitignore`**: Mengabaikan file sensitif dan log:
  - `.env` & `.env.local`
  - `liquibase.properties`
  - `*.log`

## 4. Daftar File yang Diperbarui / Dibuat
1. `/.gitignore`: Diperbarui (menambahkan `!/liquibase/` pada whitelist).
2. `/liquibase/.gitignore`: Dibuat (ignore file kredensial dan log).
3. `/liquibase/docker-compose.yml`: Dibuat (konfigurasi container Liquibase).
4. `/liquibase/.env.example`: Dibuat (template environment variables).
5. `/liquibase/markdown/instalasi.md`: Diperbarui (checklist goals `[x]`).
6. `/liquibase/markdown/result/instalasi.md`: Dibuat (dokumentasi hasil dan feedback).

## 5. Cara Penggunaan Liquibase (cara-penggunaan.md)

### A. Konfigurasi Environment (`.env`)
Salin file contoh `.env.example` menjadi `.env` di dalam folder `liquibase/`:
```bash
cd /root/dev_docker/liquibase
cp .env.example .env
```
Isi konfigurasi sesuai dengan kredensial database PostgreSQL / MySQL yang berjalan di stack infra (misal container `postgres` atau `mysql`):
```env
LIQUIBASE_URL=jdbc:postgresql://postgres:5432/dev_db_postgre
LIQUIBASE_USER=changeme_pg_user
LIQUIBASE_PASSWORD=changeme_pg_password
LIQUIBASE_CHANGELOG_FILE=changelog.sql
```

### B. Penulisan Changelog
Buat file changelog (misal `liquibase/changelog/changelog.sql`) dengan format *liquibase formatted sql*:
```sql
-- liquibase formatted sql

-- changeset developer:1
CREATE TABLE IF NOT EXISTS demo_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- rollback DROP TABLE IF EXISTS demo_users;
```

### C. Menjalankan Perintah Liquibase via Docker Compose
Masuk ke direktori `liquibase/` dan jalankan perintah Liquibase:

1. **Cek status database & changelog yang belum dieksekusi**:
   ```bash
   docker compose run --rm liquibase status
   ```

2. **Preview SQL sebelum dieksekusi (Dry-Run / Update-SQL)**:
   ```bash
   docker compose run --rm liquibase update-sql
   ```

3. **Eksekusi migrasi database (Update)**:
   ```bash
   docker compose run --rm liquibase update
   ```

4. **Rollback migrasi (jika diperlukan)**:
   ```bash
   docker compose run --rm liquibase rollback-count 1
   ```

### D. File yang Ditambahkan untuk Cara Penggunaan
1. `/liquibase/changelog/changelog.sql`: Contoh file changelog SQL terformat Liquibase.
2. `/liquibase/markdown/cara-penggunaan.md`: Diperbarui (checklist goals `[x]`).
3. `/liquibase/markdown/result/instalasi.md`: Diperbarui (penambahan section Cara Penggunaan).


## 6. Test Liquibase & Kegunaan (Plan 2 & 3)

### A. Jawaban Plan 2: Multi-Database pada MySQL Instance
- **Pertanyaan**: Apakah Liquibase membuat changelog untuk semua database (satu per satu) atau hanya 1 changelog untuk semua database?
- **Jawaban**: Liquibase **hanya membuat changelog dan tracking tables (`DATABASECHANGELOG`, `DATABASECHANGELOGLOCK`) pada 1 database spesifik** yang ditentukan di dalam JDBC URL (`LIQUIBASE_URL`).
- **Penjelasan**: Walaupun instance MySQL menampung banyak database (misal `dev_db_mysql`, `midtrans_billing_db`, `ebimbel_course`, dll.), koneksi JDBC Liquibase terikat ke satu database target pada satu waktu (`jdbc:mysql://mysql:3306/dev_db_mysql`). Untuk menerapkannya ke banyak database, jalankan command Liquibase per database atau gunakan script iterasi (loop).

### B. Kegunaan & Fungsi Liquibase (Plan 3)
1. **Version Control Skema**: Menyimpan riwayat perubahan DDL dalam format teks (`changelog.sql`).
2. **Multi-RDBMS Support**: Konsisten di MySQL, PostgreSQL, Oracle, dll.
3. **Automated & Idempotent Migration**: Mencegah migrasi ganda dengan tabel audit `DATABASECHANGELOG`.
4. **Rollback Capability**: Mendukung rollback skema secara aman.

### C. File yang Diperbarui / Dibuat
1. `/liquibase/.env`: Diperbarui (`LIQUIBASE_URL` menggunakan JDBC MySQL dan `INSTALL_MYSQL=true`).
2. `/liquibase/.env.example`: Diperbarui template JDBC MySQL.
3. `/liquibase/docker-compose.yml`: Ditambahkan environment `INSTALL_MYSQL=true` agar container otomatis menginstal MySQL JDBC driver via `lpm`.
4. `/liquibase/markdown/cara-penggunaan.md`: Diperbarui (checklist goals `[x]` dan jawaban plan 2 & 3).
5. `/liquibase/markdown/result/instalasi.md`: Ditambahkan Section 6 dokumentasi hasil Plan 2 & 3.


## 7. Praktik Penggunaan pada Database `masterep-annursulsel` (Plan 4)

### A. Alur Praktik
1. **Konfigurasi Environment**: `liquibase/.env` dikonfigurasi ke `jdbc:mysql://mysql:3306/masterep-annursulsel?useSSL=false&allowPublicKeyRetrieval=true`.
2. **Generate Changelog**: Mengekstrak 96 tabel eksisting dari `masterep-annursulsel` menjadi file `liquibase/changelog/changelog.mysql.sql` menggunakan perintah:
   ```bash
   docker compose run --rm liquibase generate-changelog --changelog-file=changelog.mysql.sql
   ```
3. **Changelog-Sync**: Menyinkronkan riwayat database eksisting tanpa menjalankan ulang DDL:
   ```bash
   docker compose run --rm liquibase changelog-sync
   ```
4. **Penambahan Changeset Baru & Update**: Menambahkan changeset `plan4-demo` (`CREATE TABLE IF NOT EXISTS liquibase_demo_log`) dan mengeksekusinya:
   ```bash
   docker compose run --rm liquibase update
   ```
5. **Rollback Uji Coba**: Menguji pembatalan changeset:
   ```bash
   docker compose run --rm liquibase rollback-count 1
   ```

### B. File yang Dibuat / Diperbarui untuk Plan 4
1. `/liquibase/changelog/changelog.mysql.sql`: File changelog format SQL yang digenerate dari `masterep-annursulsel` beserta changeset demo `plan4-demo`.
2. `/liquibase/markdown/praktik-masterep-annursulsel.md`: Dokumen panduan khusus praktik Plan 4.
3. `/liquibase/markdown/cara-penggunaan.md`: Checklist goals plan 4 diubah menjadi `[x]`.
4. `/liquibase/markdown/result/instalasi.md`: Ditambahkan Section 7 dokumentasi hasil praktik Plan 4.


## 8. Jawaban Pertanyaan Alur Kerja Migrasi vs GUI Database (Plan 5)

### A. Perubahan/Alter Tabel: Liquibase vs Navicat?
- **Jawaban**: Perubahan skema (`CREATE`, `ALTER`, `DROP`) **wajib dilakukan melalui Liquibase** (menambahkan `changeset` baru di file changelog kemudian menjalankan `docker compose run --rm liquibase update`), **bukan** langsung melalui Navicat.
- **Alasan**:
  1. **Single Source of Truth**: File changelog di Git menjadi satu-satunya acuan struktur database.
  2. **Konsistensi Multi-Environment**: Perubahan yang ditulis di changelog dapat langsung dijalankan secara identik di komputer developer lain, server staging, maupun production.
  3. **Audit & Rollback**: Setiap perubahan memiliki ID, Author, waktu eksekusi, serta skrip `-- rollback`.

### B. Apakah `DATABASECHANGELOG` & `DATABASECHANGELOGLOCK` Terisi Otomatis Saat Ubah via Navicat?
- **Jawaban**: **TIDAK**.
- **Alasan**:
  1. Liquibase bekerja sebagai **CLI/Client Tool**, bukan background service atau database trigger di dalam MySQL.
  2. Tabel `DATABASECHANGELOG` hanya di-insert saat perintah Liquibase (`update` atau `changelog-sync`) dijalankan.
  3. Tabel `DATABASECHANGELOGLOCK` hanya digunakan oleh Liquibase saat proses migrasi sedang berjalan (`LOCKED = 1`) untuk mencegah dua proses Liquibase berjalan bersamaan, lalu dikembalikan ke `LOCKED = 0` saat selesai.
- **Solusi Jika Terlanjur Mengubah via Navicat (Schema Drift)**:
  - Tuliskan SQL perubahan yang baru saja dilakukan di Navicat ke dalam file changelog sebagai changeset baru, lalu jalankan `docker compose run --rm liquibase changelog-sync` agar tercatat di `DATABASECHANGELOG` tanpa dieksekusi ulang.

### C. File yang Diperbarui untuk Plan 5
1. `/liquibase/markdown/cara-penggunaan.md`: Ditambahkan jawaban langsung pada Plan 5 serta checklist goal `[x]`.
2. `/liquibase/markdown/result/instalasi.md`: Ditambahkan Section 8 untuk dokumentasi jawaban Plan 5.

## 9. Sinkronisasi Struktur Antar-Database (`masterep_darish` vs `masterep-annursulsel`) (Plan 6)

### A. Jawaban Kasus Plan 6
- **Jawaban**: **SANGAT BISA**.
- **Penjelasan**: Liquibase memiliki perintah built-in **`diff-changelog`** (atau `diff`) yang dirancang khusus untuk membandingkan dua database berbeda (`reference-url` sebagai master/rujukan dan `url` sebagai target). Liquibase otomatis mendeteksi perbedaan tabel, kolom, tipe data, foreign key, atau index yang hilang di target, lalu men-generate file migration changelog.

### B. Cara Praktis Melakukan Sinkronisasi
1. **Jalankan Perintah `diff-changelog`**:
   ```bash
   cd /root/dev_docker/liquibase
   docker compose run --rm liquibase diff-changelog \
     --reference-url="jdbc:mysql://mysql:3306/masterep_darish?useSSL=false&allowPublicKeyRetrieval=true" \
     --reference-username=root \
     --reference-password=rootMysqlVM2026 \
     --url="jdbc:mysql://mysql:3306/masterep-annursulsel?useSSL=false&allowPublicKeyRetrieval=true" \
     --username=root \
     --password=rootMysqlVM2026 \
     --changelog-file=changelog/diff-darish-to-annursulsel.mysql.sql
   ```
2. **Preview SQL Sebelum Eksekusi (Dry-Run)**:
   ```bash
   docker compose run --rm liquibase update-sql --changelog-file=changelog/diff-darish-to-annursulsel.mysql.sql
   ```
3. **Terapkan Perubahan ke Target (`masterep-annursulsel`)**:
   ```bash
   docker compose run --rm liquibase update --changelog-file=changelog/diff-darish-to-annursulsel.mysql.sql
   ```
   Setelah perintah `update` dijalankan, seluruh tabel dan struktur dari `masterep_darish` yang sebelumnya kurang di `masterep-annursulsel` akan otomatis dibuat/disamakan.

### C. Penanganan Error Saat Migrasi Sinkronisasi
1. **Error Syntax MySQL 8 (`on update CURRENT_TIMESTAMP`)**:
   - *Masalah*: Query `ALTER TABLE ... ALTER col SET DEFAULT (CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP)` tidak didukung MySQL 8.0.
   - *Solusi*: Diubah menggunakan syntax `MODIFY COLUMN`:
     ```sql
     ALTER TABLE debit_temp MODIFY debit_temp_input_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
     ALTER TABLE employee MODIFY employee_input_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
     ```
2. **Error Data Truncation (Nilai `NULL` pada kolom `NOT NULL`)**:
   - *Masalah*: Mengubah `student_madin` menjadi `NOT NULL` gagal karena ada 10 baris data eksisting yang bernilai `NULL`.
   - *Solusi*: Update data `NULL` terlebih dahulu sebelum mengubah definisi kolom:
     ```sql
     UPDATE student SET student_madin = '' WHERE student_madin IS NULL;
     ALTER TABLE student MODIFY student_madin VARCHAR(50) NOT NULL;
     ```
3. **Hasil Akhir**: Setelah perbaikan syntax dan data, 310 changeset berhasil dijalankan (`Liquibase: Update has been successful. Rows affected: 190`). Jumlah tabel `masterep-annursulsel` kini sinkron (240 tabel).


### C. File yang Diperbarui / Dibuat untuk Plan 6
1. `/liquibase/changelog/diff-darish-to-annursulsel.mysql.sql`: File changelog hasil perbandingan struktur antara `masterep_darish` dan `masterep-annursulsel`.
2. `/liquibase/markdown/cara-penggunaan.md`: Ditambahkan jawaban Plan 6 serta update checklist goal `[x]`.
3. `/liquibase/markdown/result/instalasi.md`: Ditambahkan Section 9 dokumentasi penanganan Plan 6.


