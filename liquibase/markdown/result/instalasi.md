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
