# Odoo 18 Community - Docker Development Environment

Setup Odoo 18 Community dengan PostgreSQL 16 untuk custom module development.

## Struktur Directory

```
odoo/
├── docker-compose.yml    # Docker services config
├── config/
│   └── odoo.conf        # Odoo server config
├── addons/              # Custom modules di sini
└── README.md
```

## Quick Start

```bash
cd odoo
docker compose up -d
```

Odoo berjalan di: http://localhost:8069

Database default:

- User: `odoo`
- Password: `odoo`
- Master password: `admin`

## Custom Module Development

1. Buat module baru di `addons/`:

```bash
mkdir -p addons/my_custom_module
```

2. Struktur module standar Odoo 18:

```
my_custom_module/
├── __init__.py
├── __manifest__.py
├── models/
│   ├── __init__.py
│   └── model_name.py
├── views/
│   └── views.xml
├── security/
│   └── ir.model.access.csv
└── data/
```

3. Restart container untuk load module:

```bash
docker compose restart odoo
```

4. Aktifkan developer mode di Odoo → Apps → Update Apps List → Install module

## Useful Commands

```bash
# Start services
docker compose up -d

# Stop services
docker compose down

# View logs
docker compose logs -f odoo

# Restart Odoo (setelah modifikasi code)
docker compose restart odoo

# Access Odoo shell
docker exec -it odoo-app odoo shell -d nama_database

# Database backup
docker exec odoo-db pg_dump -U odoo nama_database > backup.sql
```

## Development Workflow

1. Buat/edit module di `addons/`
2. Restart container: `docker compose restart odoo`
3. Update module list di Odoo UI
4. Test changes
5. Commit ke git (data di-ignore otomatis)

## Notes

- Data PostgreSQL disimpan di `../databases/pg_data/` (git-ignored)
- Odoo filestore di `../databases/odoo_data/` (git-ignored)
- Custom modules di `addons/` (tracked di git)
- Config file di `config/odoo.conf` (tracked di git)
- Untuk production, ganti semua password default
