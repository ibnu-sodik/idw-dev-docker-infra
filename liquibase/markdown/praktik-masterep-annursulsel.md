# Praktik Penggunaan Liquibase pada Database `masterep-annursulsel` (Plan 4)

Dokumen ini menjelaskan langkah-langkah praktis penggunaan Liquibase pada database MySQL `masterep-annursulsel` yang sudah ada di stack Docker Compose.

## 1. Konfigurasi Environment (`.env`)
Pastikan konfigurasi `liquibase/.env` mengarah ke database target `masterep-annursulsel`:
```env
LIQUIBASE_URL=jdbc:mysql://mysql:3306/masterep-annursulsel?useSSL=false&allowPublicKeyRetrieval=true
LIQUIBASE_USER=root
LIQUIBASE_PASSWORD=rootMysqlVM2026
LIQUIBASE_CHANGELOG_FILE=changelog.mysql.sql
```

## 2. Ekstraksi Baseline Schema (Generate Changelog)
Untuk mengekstrak struktur tabel yang sudah ada di database `masterep-annursulsel` menjadi file changelog format SQL:
```bash
cd /root/dev_docker/liquibase
docker compose run --rm liquibase generate-changelog --changelog-file=changelog.mysql.sql
```

## 3. Sinkronisasi Baseline (Changelog-Sync)
Karena database `masterep-annursulsel` sudah memiliki tabel-tabel eksisting, tandai seluruh changeset baseline sebagai sudah tereksekusi tanpa menjalankan ulang perintah DDL:
```bash
docker compose run --rm liquibase changelog-sync
```

## 4. Penambahan Changeset Baru & Migrasi
Tambahkan changeset baru di bagian bawah `liquibase/changelog/changelog.mysql.sql`:
```sql
-- changeset developer:plan4-demo
CREATE TABLE IF NOT EXISTS liquibase_demo_log (
    id INT AUTO_INCREMENT NOT NULL,
    action_name VARCHAR(100) NOT NULL,
    executed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_LIQUIBASE_DEMO_LOG PRIMARY KEY (id)
);

-- rollback DROP TABLE IF EXISTS liquibase_demo_log;
```

Jalankan perintah berikut secara berurutan:
1. **Cek Status**:
   ```bash
   docker compose run --rm liquibase status
   ```
2. **Preview SQL (Dry-Run)**:
   ```bash
   docker compose run --rm liquibase update-sql
   ```
3. **Eksekusi Update**:
   ```bash
   docker compose run --rm liquibase update
   ```

## 5. Uji Rollback
Untuk membatalkan changeset terakhir (`plan4-demo`):
```bash
docker compose run --rm liquibase rollback-count 1
```
