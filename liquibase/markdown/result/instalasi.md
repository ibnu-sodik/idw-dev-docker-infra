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

