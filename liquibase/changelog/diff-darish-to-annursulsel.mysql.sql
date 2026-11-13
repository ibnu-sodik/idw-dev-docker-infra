-- liquibase formatted sql

-- changeset liquibase:1794384377701-266 splitStatements:false
ALTER TABLE bebas_pay DROP FOREIGN KEY fk_bebas_pay_bebas1;

-- changeset liquibase:1794384377701-267 splitStatements:false
ALTER TABLE bebas_pay DROP FOREIGN KEY fk_bebas_pay_users1;

-- changeset liquibase:1794384377701-268 splitStatements:false
ALTER TABLE bebas DROP FOREIGN KEY fk_bebas_payment1;

-- changeset liquibase:1794384377701-269 splitStatements:false
ALTER TABLE bebas DROP FOREIGN KEY fk_bebas_student1;

-- changeset liquibase:1794384377701-270 splitStatements:false
ALTER TABLE bulan DROP FOREIGN KEY fk_bulan_month1;

-- changeset liquibase:1794384377701-271 splitStatements:false
ALTER TABLE bulan DROP FOREIGN KEY fk_bulan_payment1;

-- changeset liquibase:1794384377701-272 splitStatements:false
ALTER TABLE bulan DROP FOREIGN KEY fk_bulan_student1;

-- changeset liquibase:1794384377701-273 splitStatements:false
ALTER TABLE bulan DROP FOREIGN KEY fk_bulan_users1;

-- changeset liquibase:1794384377701-274 splitStatements:false
ALTER TABLE logs DROP FOREIGN KEY fk_g_activity_log_g_user1;

-- changeset liquibase:1794384377701-275 splitStatements:false
ALTER TABLE hutang_pay DROP FOREIGN KEY fk_hutang_pay_hutang1;

-- changeset liquibase:1794384377701-276 splitStatements:false
ALTER TABLE hutang_pay DROP FOREIGN KEY fk_hutang_pay_users1;

-- changeset liquibase:1794384377701-277 splitStatements:false
ALTER TABLE hutang DROP FOREIGN KEY fk_hutang_settinghutang1;

-- changeset liquibase:1794384377701-278 splitStatements:false
ALTER TABLE information DROP FOREIGN KEY fk_information_users1;

-- changeset liquibase:1794384377701-279 splitStatements:false
ALTER TABLE debit DROP FOREIGN KEY fk_jurnal_debit_users1;

-- changeset liquibase:1794384377701-280 splitStatements:false
ALTER TABLE kredit DROP FOREIGN KEY fk_jurnal_kredit_users1;

-- changeset liquibase:1794384377701-281 splitStatements:false
ALTER TABLE log_hutang DROP FOREIGN KEY fk_log_hutang_hutang1;

-- changeset liquibase:1794384377701-282 splitStatements:false
ALTER TABLE log_hutang DROP FOREIGN KEY fk_log_hutang_hutang_pay1;

-- changeset liquibase:1794384377701-283 splitStatements:false
ALTER TABLE log_trx DROP FOREIGN KEY fk_log_trx_bebas_pay1;

-- changeset liquibase:1794384377701-284 splitStatements:false
ALTER TABLE log_trx DROP FOREIGN KEY fk_log_trx_bulan1;

-- changeset liquibase:1794384377701-285 splitStatements:false
ALTER TABLE log_trx DROP FOREIGN KEY fk_log_trx_student1;

-- changeset liquibase:1794384377701-286 splitStatements:false
ALTER TABLE payment DROP FOREIGN KEY fk_payment_period1;

-- changeset liquibase:1794384377701-287 splitStatements:false
ALTER TABLE payment DROP FOREIGN KEY fk_payment_pos1;

-- changeset liquibase:1794384377701-288 splitStatements:false
ALTER TABLE settinghutang DROP FOREIGN KEY fk_settinghutang_period1;

-- changeset liquibase:1794384377701-289 splitStatements:false
ALTER TABLE settinghutang DROP FOREIGN KEY fk_settinghutang_pos1;

-- changeset liquibase:1794384377701-290 splitStatements:false
ALTER TABLE student DROP FOREIGN KEY fk_student_class1;

-- changeset liquibase:1794384377701-291 splitStatements:false
ALTER TABLE student DROP FOREIGN KEY fk_student_majors1;

-- changeset liquibase:1794384377701-292 splitStatements:false
ALTER TABLE users DROP FOREIGN KEY fk_user_user_role1;

-- changeset liquibase:1794384377701-34 splitStatements:false
CREATE TABLE accessed_menus (id INT AUTO_INCREMENT NOT NULL, student_id VARCHAR(255) NULL, school_code VARCHAR(255) NULL, school_name VARCHAR(255) NULL, menu_name VARCHAR(255) NULL, accessed_at datetime(0) NULL, CONSTRAINT PK_ACCESSED_MENUS PRIMARY KEY (id));

-- changeset liquibase:1794384377701-35 splitStatements:false
CREATE TABLE aktivitas (aktivitas_id INT AUTO_INCREMENT NOT NULL, aktivitas_standar_id INT NULL, aktivitas_kode VARCHAR(20) NOT NULL, aktivitas_account_id INT NOT NULL, aktivitas_name TEXT NOT NULL, CONSTRAINT PK_AKTIVITAS PRIMARY KEY (aktivitas_id));

-- changeset liquibase:1794384377701-36 splitStatements:false
CREATE TABLE akun_ipaymu (id INT NOT NULL, unit_id INT NOT NULL, akun_id INT NOT NULL, tipe ENUM('pembayaran', 'tabungan', 'donasi') NOT NULL, CONSTRAINT PK_AKUN_IPAYMU PRIMARY KEY (id));

-- changeset liquibase:1794384377701-37 splitStatements:false
CREATE TABLE anggaran (anggaran_id INT AUTO_INCREMENT NOT NULL, anggaran_period_id INT NULL, anggaran_account_id INT NULL, anggaran_input_date timestamp(0) NULL, anggaran_last_update timestamp(0) NULL, CONSTRAINT PK_ANGGARAN PRIMARY KEY (anggaran_id));

-- changeset liquibase:1794384377701-38 splitStatements:false
CREATE TABLE anggaran_detail (anggaran_detail_id INT AUTO_INCREMENT NOT NULL, anggaran_detail_anggaran_id INT NOT NULL, anggaran_detail_month_id INT NOT NULL, anggaran_detail_nominal INT NOT NULL, CONSTRAINT PK_ANGGARAN_DETAIL PRIMARY KEY (anggaran_detail_id));

-- changeset liquibase:1794384377701-39 splitStatements:false
CREATE TABLE ars_jenis (id_jenis INT AUTO_INCREMENT NOT NULL, jenis_arsip VARCHAR(50) NOT NULL, majors_id VARCHAR(50) NOT NULL, create_date date NOT NULL, CONSTRAINT PK_ARS_JENIS PRIMARY KEY (id_jenis));

-- changeset liquibase:1794384377701-40 splitStatements:false
CREATE TABLE ars_lokasi (id_lokasi INT AUTO_INCREMENT NOT NULL, nama_lokasi VARCHAR(80) NOT NULL, tanggal date NOT NULL, CONSTRAINT PK_ARS_LOKASI PRIMARY KEY (id_lokasi));

-- changeset liquibase:1794384377701-41 splitStatements:false
CREATE TABLE ars_pengajuan (id_pengajuan INT AUTO_INCREMENT NOT NULL, id_pejabat VARCHAR(60) NOT NULL, id_satuan VARCHAR(50) NOT NULL, nama_arsip VARCHAR(60) NOT NULL, jumlah VARCHAR(50) NOT NULL, satuan VARCHAR(50) NOT NULL, tanggal date NOT NULL, tujuan TEXT NOT NULL, file_arsip VARCHAR(50) NULL, id_jenis VARCHAR(50) NOT NULL, nonaktif ENUM('n', 'y') NOT NULL, CONSTRAINT PK_ARS_PENGAJUAN PRIMARY KEY (id_pengajuan));

-- changeset liquibase:1794384377701-42 splitStatements:false
CREATE TABLE ars_satuan (id_satuan INT AUTO_INCREMENT NOT NULL, nama_satuan VARCHAR(30) NOT NULL, keterangan VARCHAR(100) NOT NULL, CONSTRAINT PK_ARS_SATUAN PRIMARY KEY (id_satuan));

-- changeset liquibase:1794384377701-43 splitStatements:false
CREATE TABLE arsip (id_arsip INT AUTO_INCREMENT NOT NULL, id_jenis VARCHAR(15) NOT NULL, id_users INT NOT NULL, nama_arsip VARCHAR(50) NOT NULL, file_arsip VARCHAR(50) NOT NULL, jumlah VARCHAR(20) NOT NULL, id_satuan VARCHAR(20) NOT NULL, lokasi VARCHAR(50) NOT NULL, ket_isi TEXT NOT NULL, status INT NOT NULL, tanggal date NOT NULL, permision VARCHAR(30) NOT NULL, CONSTRAINT PK_ARSIP PRIMARY KEY (id_arsip));

-- changeset liquibase:1794384377701-44 splitStatements:false
CREATE TABLE banking_limit (id INT AUTO_INCREMENT NOT NULL, nis VARCHAR(100) NOT NULL, `limit` INT DEFAULT 0 NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_BANKING_LIMIT PRIMARY KEY (id));

-- changeset liquibase:1794384377701-45 splitStatements:false
CREATE TABLE barang (barang_id INT AUTO_INCREMENT NOT NULL, barang_no VARCHAR(50) NOT NULL, barang_name VARCHAR(225) NOT NULL, barang_stok INT NOT NULL, satuan_id INT NULL, keterangan TEXT NOT NULL, gambar VARCHAR(255) NOT NULL, user_id INT NOT NULL, input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG PRIMARY KEY (barang_id));

-- changeset liquibase:1794384377701-46 splitStatements:false
CREATE TABLE barang_guru (barang_guru_id INT AUTO_INCREMENT NOT NULL, barang_guru_no VARCHAR(50) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG_GURU PRIMARY KEY (barang_guru_id));

-- changeset liquibase:1794384377701-47 splitStatements:false
CREATE TABLE barang_permintaan_guru (permintaan_id INT AUTO_INCREMENT NOT NULL, barang_id INT NOT NULL, jumlah INT NOT NULL, barang_guru_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG_PERMINTAAN_GURU PRIMARY KEY (permintaan_id));

-- changeset liquibase:1794384377701-48 splitStatements:false
CREATE TABLE barang_permintaan_siswa (permintaan_id INT AUTO_INCREMENT NOT NULL, barang_id INT NOT NULL, jumlah INT NOT NULL, barang_siswa_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG_PERMINTAAN_SISWA PRIMARY KEY (permintaan_id));

-- changeset liquibase:1794384377701-49 splitStatements:false
CREATE TABLE barang_siswa (barang_siswa_id INT AUTO_INCREMENT NOT NULL, barang_siswa_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, catatan TEXT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG_SISWA PRIMARY KEY (barang_siswa_id));

-- changeset liquibase:1794384377701-50 splitStatements:false
CREATE TABLE batch_item (batch_item_id INT AUTO_INCREMENT NOT NULL, batch_item_payment_id INT NULL, batch_item_batchpayment_id INT NULL, CONSTRAINT PK_BATCH_ITEM PRIMARY KEY (batch_item_id));

-- changeset liquibase:1794384377701-51 splitStatements:false
CREATE TABLE batchpayment (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, bp_majors_id INT NOT NULL, bp_period_id INT NOT NULL, CONSTRAINT PK_BATCHPAYMENT PRIMARY KEY (id));

-- changeset liquibase:1794384377701-52 splitStatements:false
CREATE TABLE bebas_jurnal (bebas_jurnal_id INT AUTO_INCREMENT NOT NULL, bebas_jurnal_noref VARCHAR(50) NOT NULL, bebas_jurnal_account_code VARCHAR(30) NOT NULL, bebas_jurnal_bebas_id INT NOT NULL, bebas_jurnal_nominal INT NOT NULL, CONSTRAINT PK_BEBAS_JURNAL PRIMARY KEY (bebas_jurnal_id));

-- changeset liquibase:1794384377701-53 splitStatements:false
CREATE TABLE bebas_pay_mobile (bebas_pay_id INT AUTO_INCREMENT NOT NULL, bebas_bebas_id INT NULL, bebas_pay_noref VARCHAR(50) NULL, bebas_pay_account_id INT NULL, bebas_pay_number VARCHAR(100) NULL, bebas_pay_bill DECIMAL(10) NULL, bebas_pay_desc VARCHAR(100) NULL, user_user_id INT NULL, sekolah_id CHAR(100) NOT NULL, bebas_pay_input_date date NULL, bebas_pay_last_update timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, flip_no_trans VARCHAR(100) NULL, flip_status VARCHAR(100) NULL, CONSTRAINT PK_BEBAS_PAY_MOBILE PRIMARY KEY (bebas_pay_id));

-- changeset liquibase:1794384377701-54 splitStatements:false
CREATE TABLE bmi_inquiry (id INT AUTO_INCREMENT NOT NULL, CCY VARCHAR(50) NULL, VANO VARCHAR(50) NULL, TRXDATE VARCHAR(50) NULL, USERNAME VARCHAR(100) NULL, PASSWORD VARCHAR(100) NULL, CHANNELID VARCHAR(50) NULL, REFNO VARCHAR(50) NULL, BILL VARCHAR(50) NULL, DESCRIPTION TEXT NULL, DESCRIPTION2 TEXT NULL, ERR VARCHAR(50) NULL, METHOD VARCHAR(50) NULL, CUSTNAME VARCHAR(50) NULL, remark VARCHAR(100) NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_BMI_INQUIRY PRIMARY KEY (id));

-- changeset liquibase:1794384377701-55 splitStatements:false
CREATE TABLE bmi_log (id INT AUTO_INCREMENT NOT NULL, txt TEXT NULL, created_date VARCHAR(100) NULL, CONSTRAINT PK_BMI_LOG PRIMARY KEY (id));

-- changeset liquibase:1794384377701-56 splitStatements:false
CREATE TABLE bmi_payment (ID INT AUTO_INCREMENT NOT NULL, TRXDATE VARCHAR(100) NULL, CCY VARCHAR(100) NULL, REFNO VARCHAR(100) NULL, BILL VARCHAR(100) NULL, PAYMENT VARCHAR(100) NULL, CHANNELID VARCHAR(100) NULL, METHOD VARCHAR(100) NULL, VANO VARCHAR(100) NULL, CUSTNAME VARCHAR(100) NULL, USERNAME VARCHAR(100) NULL, PASSWORD VARCHAR(100) NULL, DESCRIPTION2 VARCHAR(100) NULL, DESCRIPTION VARCHAR(100) NULL, ERR VARCHAR(100) NULL, IP_SOURCE VARCHAR(100) NULL, remark VARCHAR(100) NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_BMI_PAYMENT PRIMARY KEY (ID));

-- changeset liquibase:1794384377701-57 splitStatements:false
CREATE TABLE bmi_refersal (ID INT AUTO_INCREMENT NOT NULL, CCY VARCHAR(100) NULL, CUSTNAME VARCHAR(100) NULL, TRXDATE VARCHAR(100) NULL, REFNO VARCHAR(100) NULL, BILL VARCHAR(100) NULL, CHANNELID VARCHAR(100) NULL, METHOD VARCHAR(100) NULL, PYMTDATE VARCHAR(100) NULL, PAYMENT VARCHAR(100) NULL, VANO VARCHAR(100) NULL, USERNAME VARCHAR(100) NULL, PASSWORD VARCHAR(100) NULL, ERR VARCHAR(100) NULL, remark VARCHAR(100) NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_BMI_REFERSAL PRIMARY KEY (ID));

-- changeset liquibase:1794384377701-58 splitStatements:false
CREATE TABLE bmi_transaksi (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal datetime(0) NOT NULL, student_id INT NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, va_transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_BMI_TRANSAKSI PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-59 splitStatements:false
CREATE TABLE budget_detail (budget_detail_id INT AUTO_INCREMENT NOT NULL, budget_detail_budgeting_id INT NOT NULL, budget_detail_bulan_id INT NOT NULL, budget_detail_satuan_id INT NOT NULL, budget_detail_nominal INT NOT NULL, budget_detail_jumlah INT NOT NULL, budget_created_at timestamp(0) DEFAULT NOW() NOT NULL, budget_updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BUDGET_DETAIL PRIMARY KEY (budget_detail_id));

-- changeset liquibase:1794384377701-60 splitStatements:false
CREATE TABLE budgeting (budgeting_id INT AUTO_INCREMENT NOT NULL, budgeting_worksheet_id INT NOT NULL, budgeting_kegiatan_id INT NOT NULL, budgeting_aktivitas_id INT NOT NULL, budgeting_uraian TEXT NOT NULL, budgeting_created_at timestamp(0) DEFAULT NOW() NOT NULL, budgeting_updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BUDGETING PRIMARY KEY (budgeting_id));

-- changeset liquibase:1794384377701-61 splitStatements:false
CREATE TABLE bulan_jurnal (bulan_jurnal_id INT AUTO_INCREMENT NOT NULL, bulan_jurnal_noref VARCHAR(50) NOT NULL, bulan_jurnal_account_code VARCHAR(30) NOT NULL, bulan_jurnal_bulan_id INT NOT NULL, bulan_jurnal_nominal INT NOT NULL, CONSTRAINT PK_BULAN_JURNAL PRIMARY KEY (bulan_jurnal_id));

-- changeset liquibase:1794384377701-62 splitStatements:false
CREATE TABLE bulan_pay_temp (id INT AUTO_INCREMENT NOT NULL, bulan_id INT NULL, bulan_noref VARCHAR(100) NULL, bulan_account_id INT NULL, student_student_id INT NULL, bulan_number_pay VARCHAR(100) NULL, bulan_date_pay VARCHAR(100) NULL, user_user_id VARCHAR(100) NULL, created_date VARCHAR(100) NULL, CONSTRAINT PK_BULAN_PAY_TEMP PRIMARY KEY (id));

-- changeset liquibase:1794384377701-63 splitStatements:false
CREATE TABLE callback_booking (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_CALLBACK_BOOKING PRIMARY KEY (id));

-- changeset liquibase:1794384377701-64 splitStatements:false
CREATE TABLE callback_donasi (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_CALLBACK_DONASI PRIMARY KEY (id));

-- changeset liquibase:1794384377701-65 splitStatements:false
CREATE TABLE cara_bayar (id INT AUTO_INCREMENT NOT NULL, gambar TEXT NULL, nama_gambar TEXT NULL, cara1 TEXT NULL, cara2 TEXT NULL, cara3 TEXT NULL, CONSTRAINT PK_CARA_BAYAR PRIMARY KEY (id));

-- changeset liquibase:1794384377701-66 splitStatements:false
CREATE TABLE cards (id INT AUTO_INCREMENT NOT NULL, nis VARCHAR(100) NOT NULL, rfid VARCHAR(100) NULL, pin VARCHAR(100) NOT NULL, status ENUM('Y', 'N') NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_CARDS PRIMARY KEY (id));

-- changeset liquibase:1794384377701-67 splitStatements:false
CREATE TABLE category (category_id INT AUTO_INCREMENT NOT NULL, category_name VARCHAR(50) NULL, CONSTRAINT PK_CATEGORY PRIMARY KEY (category_id));

-- changeset liquibase:1794384377701-68 splitStatements:false
CREATE TABLE data_absensi_pengasuh (id INT AUTO_INCREMENT NOT NULL, id_pegawai INT NOT NULL, jenis_absen VARCHAR(100) NULL, statushadir VARCHAR(50) NULL, area_absen INT NOT NULL, bulan VARCHAR(100) NULL, tanggal date NULL, time VARCHAR(100) NULL, jam timestamp(0) DEFAULT NOW() NULL, longi VARCHAR(100) NULL, lati VARCHAR(100) NULL, lokasi VARCHAR(50) NULL, month VARCHAR(50) NULL, year VARCHAR(50) NULL, keterlambatan TEXT NULL, foto TEXT NULL, catatan_absen TEXT NULL, remark TEXT NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_DATA_ABSENSI_PENGASUH PRIMARY KEY (id));

-- changeset liquibase:1794384377701-69 splitStatements:false
CREATE TABLE data_flip_callback (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, bill_id VARCHAR(100) NULL, bill_link VARCHAR(255) NULL, bill_title VARCHAR(255) NULL, sender_bank_type VARCHAR(100) NULL, sender_bank VARCHAR(100) NULL, amount VARCHAR(100) NULL, status VARCHAR(100) NULL, sender_name VARCHAR(100) NULL, sender_email VARCHAR(100) NULL, created_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_FLIP_CALLBACK PRIMARY KEY (id));

-- changeset liquibase:1794384377701-70 splitStatements:false
CREATE TABLE data_flip_callback_donasi (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, bill_id VARCHAR(100) NULL, bill_link VARCHAR(255) NULL, bill_title VARCHAR(255) NULL, sender_bank_type VARCHAR(100) NULL, sender_bank VARCHAR(100) NULL, amount VARCHAR(100) NULL, status VARCHAR(100) NULL, sender_name VARCHAR(100) NULL, sender_email VARCHAR(100) NULL, created_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_FLIP_CALLBACK_DONASI PRIMARY KEY (id));

-- changeset liquibase:1794384377701-71 splitStatements:false
CREATE TABLE data_flip_callback_penginapan (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, bill_id VARCHAR(100) NULL, bill_link VARCHAR(255) NULL, bill_title VARCHAR(255) NULL, sender_bank_type VARCHAR(100) NULL, sender_bank VARCHAR(100) NULL, amount VARCHAR(100) NULL, status VARCHAR(100) NULL, sender_name VARCHAR(100) NULL, sender_email VARCHAR(100) NULL, created_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_FLIP_CALLBACK_PENGINAPAN PRIMARY KEY (id));

-- changeset liquibase:1794384377701-72 splitStatements:false
CREATE TABLE data_flip_callback_tabungan (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, bill_id VARCHAR(100) NULL, bill_link VARCHAR(255) NULL, bill_title VARCHAR(255) NULL, sender_bank_type VARCHAR(100) NULL, sender_bank VARCHAR(100) NULL, amount VARCHAR(100) NULL, status VARCHAR(100) NULL, sender_name VARCHAR(100) NULL, sender_email VARCHAR(100) NULL, created_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_FLIP_CALLBACK_TABUNGAN PRIMARY KEY (id));

-- changeset liquibase:1794384377701-73 splitStatements:false
CREATE TABLE data_flip_channel (id BIGINT AUTO_INCREMENT NOT NULL, payment_channel VARCHAR(250) DEFAULT '' NOT NULL, bank VARCHAR(250) DEFAULT '' NOT NULL, logo VARCHAR(250) DEFAULT '' NOT NULL, status VARCHAR(250) DEFAULT 'N' NOT NULL, kode VARCHAR(250) DEFAULT 'N' NOT NULL, cara_bayar TEXT NULL, fee INT DEFAULT 0 NULL, CONSTRAINT PK_DATA_FLIP_CHANNEL PRIMARY KEY (id));

-- changeset liquibase:1794384377701-74 splitStatements:false
CREATE TABLE data_hari_libur (id INT AUTO_INCREMENT NOT NULL, hari VARCHAR(50) NULL, keterangan TEXT NULL, created_by INT NULL, created_date datetime(0) NULL, updated_by INT NULL, updated_date datetime(0) NULL, CONSTRAINT PK_DATA_HARI_LIBUR PRIMARY KEY (id));

-- changeset liquibase:1794384377701-75 splitStatements:false
CREATE TABLE data_ipaymu (id INT AUTO_INCREMENT NOT NULL, sessionId VARCHAR(100) NULL, TransactionId VARCHAR(100) NULL, Fee VARCHAR(100) NULL, Expired VARCHAR(100) NULL, PaymentNo VARCHAR(100) NULL, PaymentName VARCHAR(100) NULL, Total VARCHAR(100) NULL, Via VARCHAR(100) NULL, Channel VARCHAR(100) NULL, paymentChannel VARCHAR(100) NULL, paymentMethod VARCHAR(100) NULL, nama VARCHAR(100) NULL, email VARCHAR(100) NULL, phone VARCHAR(100) NULL, jumlah VARCHAR(100) NULL, nominal VARCHAR(100) NULL, alamat VARCHAR(100) NULL, kurir VARCHAR(100) NULL, ongkir VARCHAR(100) NULL, produk VARCHAR(100) NULL, bulan_id VARCHAR(100) NULL, student_id VARCHAR(100) NULL, status VARCHAR(100) DEFAULT 'BARU' NULL, remark VARCHAR(100) NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_DATA_IPAYMU PRIMARY KEY (id));

-- changeset liquibase:1794384377701-76 splitStatements:false
CREATE TABLE data_ipaymu_callback (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_IPAYMU_CALLBACK PRIMARY KEY (id));

-- changeset liquibase:1794384377701-77 splitStatements:false
CREATE TABLE data_ipaymu_callback_donasi (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_IPAYMU_CALLBACK_DONASI PRIMARY KEY (id));

-- changeset liquibase:1794384377701-78 splitStatements:false
CREATE TABLE data_ipaymu_callback_penginapan (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_IPAYMU_CALLBACK_PENGINAPAN PRIMARY KEY (id));

-- changeset liquibase:1794384377701-79 splitStatements:false
CREATE TABLE data_ipaymu_callback_tabungan (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_IPAYMU_CALLBACK_TABUNGAN PRIMARY KEY (id));

-- changeset liquibase:1794384377701-80 splitStatements:false
CREATE TABLE data_ipaymu_channel (id BIGINT AUTO_INCREMENT NOT NULL, payment_channel VARCHAR(250) DEFAULT '' NOT NULL, bank VARCHAR(250) DEFAULT '' NOT NULL, logo VARCHAR(250) DEFAULT '' NOT NULL, status VARCHAR(250) DEFAULT 'N' NOT NULL, kode VARCHAR(250) DEFAULT 'N' NOT NULL, fee INT DEFAULT 0 NOT NULL, cara_bayar TEXT NULL, remark TEXT NULL, created_by VARCHAR(50) NULL, created_date VARCHAR(50) NULL, updated_by VARCHAR(50) NULL, updated_date VARCHAR(50) NULL, CONSTRAINT PK_DATA_IPAYMU_CHANNEL PRIMARY KEY (id));

-- changeset liquibase:1794384377701-81 splitStatements:false
CREATE TABLE data_ipaymu_new (id INT AUTO_INCREMENT NOT NULL, sessionId VARCHAR(100) NULL, TransactionId VARCHAR(100) NULL, Fee VARCHAR(100) NULL, Expired VARCHAR(100) NULL, PaymentNo VARCHAR(100) NULL, PaymentName VARCHAR(100) NULL, Total VARCHAR(100) NULL, Via VARCHAR(100) NULL, Channel VARCHAR(100) NULL, paymentChannel VARCHAR(100) NULL, paymentMethod VARCHAR(100) NULL, nama VARCHAR(100) NULL, email VARCHAR(100) NULL, phone VARCHAR(100) NULL, jumlah VARCHAR(100) NULL, nominal VARCHAR(100) NULL, bulan_id VARCHAR(100) NULL, student_id VARCHAR(100) NULL, nama_tagihan VARCHAR(150) NULL, status VARCHAR(100) DEFAULT 'BARU' NULL, remark VARCHAR(100) NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_DATA_IPAYMU_NEW PRIMARY KEY (id));

-- changeset liquibase:1794384377701-82 splitStatements:false
CREATE TABLE data_ipaymu_notif (id INT AUTO_INCREMENT NOT NULL, txt TEXT NULL, ip VARCHAR(50) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_IPAYMU_NOTIF PRIMARY KEY (id));

-- changeset liquibase:1794384377701-83 splitStatements:false
CREATE TABLE data_ipaymu_notif_log (id INT AUTO_INCREMENT NOT NULL, txt TEXT NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_DATA_IPAYMU_NOTIF_LOG PRIMARY KEY (id));

-- changeset liquibase:1794384377701-84 splitStatements:false
CREATE TABLE data_pembayaran (id_pembayaran INT AUTO_INCREMENT NOT NULL, noref VARCHAR(50) NOT NULL, kode_pondok INT NOT NULL, nis INT NOT NULL, nominal VARCHAR(100) NOT NULL, bayar_via VARCHAR(100) NULL, status INT NULL, create_date timestamp(6) DEFAULT NOW(6) NOT NULL, update_date timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_DATA_PEMBAYARAN PRIMARY KEY (id_pembayaran));

-- changeset liquibase:1794384377701-85 splitStatements:false
CREATE TABLE data_waktu_pengasuh (data_waktu_id INT AUTO_INCREMENT NOT NULL, data_waktu_name VARCHAR(50) NULL, data_waktu_majors_id INT NOT NULL, data_waktu_day_id INT NOT NULL, data_waktu_masuk time NOT NULL, data_waktu_pulang time NOT NULL, CONSTRAINT PK_DATA_WAKTU_PENGASUH PRIMARY KEY (data_waktu_id));

-- changeset liquibase:1794384377701-86 splitStatements:false
CREATE TABLE dokumen (dokumen_id INT AUTO_INCREMENT NOT NULL, dokumen_file VARCHAR(50) NOT NULL, dokumen_note TEXT NOT NULL, dokumen_employee_id INT NOT NULL, CONSTRAINT PK_DOKUMEN PRIMARY KEY (dokumen_id));

-- changeset liquibase:1794384377701-87 splitStatements:false
CREATE TABLE donasi (donasi_id INT AUTO_INCREMENT NOT NULL, program_program_id INT NOT NULL, donasi_nominal INT DEFAULT 10000 NOT NULL, donasi_note VARCHAR(100) NULL, donasi_status TINYINT(1) DEFAULT 0 NOT NULL, donasi_ref_id VARCHAR(10) NOT NULL, donasi_name VARCHAR(100) NOT NULL, donasi_alamat VARCHAR(100) NULL, donasi_hp VARCHAR(20) NOT NULL, donasi_datetime timestamp(0) DEFAULT NOW() NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_DONASI PRIMARY KEY (donasi_id));

-- changeset liquibase:1794384377701-88 splitStatements:false
CREATE TABLE employee_cards (id INT AUTO_INCREMENT NOT NULL, nip VARCHAR(100) NOT NULL, rfid VARCHAR(100) NULL, pin VARCHAR(100) NOT NULL, status ENUM('Y', 'N') NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_EMPLOYEE_CARDS PRIMARY KEY (id));

-- changeset liquibase:1794384377701-89 splitStatements:false
CREATE TABLE flip_donasi (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, student_id INT NULL, noref VARCHAR(50) NULL, tanggal date NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_FLIP_DONASI PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-90 splitStatements:false
CREATE TABLE flip_penginapan (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, student_id INT NULL, noref VARCHAR(50) NULL, tanggal date NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_FLIP_PENGINAPAN PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-91 splitStatements:false
CREATE TABLE flip_transaksi (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal datetime(0) NOT NULL, student_id INT NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_FLIP_TRANSAKSI PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-92 splitStatements:false
CREATE TABLE flip_transaksi_tabungan (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal datetime(0) NOT NULL, student_id INT NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_FLIP_TRANSAKSI_TABUNGAN PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-93 splitStatements:false
CREATE TABLE gaji_default (default_gaji_id INT AUTO_INCREMENT NOT NULL, default_gaji_name VARCHAR(225) NULL, default_gaji_mode INT NULL, CONSTRAINT PK_GAJI_DEFAULT PRIMARY KEY (default_gaji_id));

-- changeset liquibase:1794384377701-94 splitStatements:false
CREATE TABLE gaji_setting (gaji_setting_id BIGINT AUTO_INCREMENT NOT NULL, gaji_setting_name VARCHAR(225) NOT NULL, gaji_setting_default_id INT NOT NULL, gaji_setting_nominal INT DEFAULT 0 NOT NULL, gaji_setting_employee_id INT NOT NULL, gaji_setting_date_input datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_GAJI_SETTING PRIMARY KEY (gaji_setting_id));

-- changeset liquibase:1794384377701-95 splitStatements:false
CREATE TABLE gaji_slip (gaji_slip_id BIGINT AUTO_INCREMENT NOT NULL, gaji_slip_name VARCHAR(225) NOT NULL, gaji_slip_setting_id INT NOT NULL, gaji_slip_nominal INT DEFAULT 0 NOT NULL, gaji_slip_gaji_id INT NOT NULL, gaji_slip_date_input datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_GAJI_SLIP PRIMARY KEY (gaji_slip_id));

-- changeset liquibase:1794384377701-96 splitStatements:false
CREATE TABLE gallery (gallery_id INT AUTO_INCREMENT NOT NULL, gallery_img TEXT NOT NULL, gallery_homestay_id INT NOT NULL, gallery_create_at timestamp(0) DEFAULT NOW() NOT NULL, gallery_update_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_GALLERY PRIMARY KEY (gallery_id));

-- changeset liquibase:1794384377701-97 splitStatements:false
CREATE TABLE halaqoh (halaqoh_id INT AUTO_INCREMENT NOT NULL, halaqoh_name VARCHAR(45) NULL, halaqoh_majors_id INT NOT NULL, halaqoh_employee_id INT NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_HALAQOH PRIMARY KEY (halaqoh_id));

-- changeset liquibase:1794384377701-98 splitStatements:false
CREATE TABLE halaqoh_group (halaqoh_group_id INT AUTO_INCREMENT NOT NULL, halaqoh_group_student_id INT NOT NULL, halaqoh_group_group_id INT NOT NULL, CONSTRAINT PK_HALAQOH_GROUP PRIMARY KEY (halaqoh_group_id));

-- changeset liquibase:1794384377701-99 splitStatements:false
CREATE TABLE halaqoh_relation (relation_id INT AUTO_INCREMENT NOT NULL, relation_student_id INT NULL, relation_halaqoh_id INT NULL, relation_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_HALAQOH_RELATION PRIMARY KEY (relation_id));

-- changeset liquibase:1794384377701-100 splitStatements:false
CREATE TABLE homestay (homestay_id INT AUTO_INCREMENT NOT NULL, homestay_name VARCHAR(100) NOT NULL, homestay_price DOUBLE NOT NULL, homestay_desc TEXT NOT NULL, homestay_user_id INT NOT NULL, homestay_longitude TEXT NOT NULL, homestay_latitude TEXT NOT NULL, homestay_alamat VARCHAR(100) NULL, homestay_recomended ENUM('Y', 'N') NULL, homestay_create_at timestamp(0) DEFAULT NOW() NOT NULL, homestay_update_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_HOMESTAY PRIMARY KEY (homestay_id));

-- changeset liquibase:1794384377701-101 splitStatements:false
CREATE TABLE input_banking (input_banking_id INT AUTO_INCREMENT NOT NULL, input_banking_period_id INT NOT NULL, input_banking_noref VARCHAR(50) NULL, input_banking_account_id INT NULL, input_banking_debit INT NOT NULL, input_banking_kredit INT NOT NULL, input_banking_date date NOT NULL, input_banking_code INT NOT NULL, input_banking_student_id INT NOT NULL, input_banking_note TEXT NOT NULL, input_user_user_id INT NOT NULL, input_ipaymu_no_trans VARCHAR(50) NULL, input_ipaymu_status VARCHAR(50) NULL, input_flip_no_trans VARCHAR(50) NULL, input_flip_status VARCHAR(50) NULL, input_banking_status TINYINT(1) DEFAULT 0 NULL, CONSTRAINT PK_INPUT_BANKING PRIMARY KEY (input_banking_id));

-- changeset liquibase:1794384377701-102 splitStatements:false
CREATE TABLE instansi (nama_instansi VARCHAR(100) NOT NULL, alamat_lengkap TEXT NOT NULL, telp VARCHAR(30) NOT NULL, informasi TEXT NOT NULL, keterangan_situs TEXT NOT NULL, fax VARCHAR(30) NOT NULL, npwp VARCHAR(40) NOT NULL, logo VARCHAR(50) NOT NULL, favicon VARCHAR(40) NOT NULL);

-- changeset liquibase:1794384377701-103 splitStatements:false
CREATE TABLE ipaymu_donasi (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal date NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, va_transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_IPAYMU_DONASI PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-104 splitStatements:false
CREATE TABLE ipaymu_penginapan (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal date NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, va_transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_IPAYMU_PENGINAPAN PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-105 splitStatements:false
CREATE TABLE ipaymu_transaksi (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal datetime(0) NOT NULL, student_id INT NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, va_transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_IPAYMU_TRANSAKSI PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-106 splitStatements:false
CREATE TABLE ipaymu_transaksi_tabungan (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal datetime(0) NOT NULL, student_id INT NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, va_transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_IPAYMU_TRANSAKSI_TABUNGAN PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794384377701-107 splitStatements:false
CREATE TABLE jenis_keterangan (keterangan_id INT AUTO_INCREMENT NOT NULL, keterangan_nama VARCHAR(225) NOT NULL, keterangan_isi TEXT NOT NULL, keterangan_update timestamp(0) DEFAULT NOW() NOT NULL, keterangan_kop TEXT NOT NULL, CONSTRAINT PK_JENIS_KETERANGAN PRIMARY KEY (keterangan_id));

-- changeset liquibase:1794384377701-108 splitStatements:false
CREATE TABLE jurnal_umum (id INT UNSIGNED AUTO_INCREMENT NOT NULL, sekolah_id INT NOT NULL, keterangan VARCHAR(200) NOT NULL, noref VARCHAR(50) NOT NULL, tanggal date NOT NULL, pencatatan ENUM('manual', 'auto') DEFAULT 'manual' NOT NULL, waktu_update timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, keterangan_lainnya VARCHAR(500) NOT NULL, CONSTRAINT PK_JURNAL_UMUM PRIMARY KEY (id));

-- changeset liquibase:1794384377701-109 splitStatements:false
CREATE TABLE jurnal_umum_detail (id INT UNSIGNED AUTO_INCREMENT NOT NULL, id_jurnal INT UNSIGNED NOT NULL, account_code VARCHAR(20) NOT NULL, debet DECIMAL(30, 2) UNSIGNED NULL, kredit DECIMAL(30, 2) UNSIGNED NULL, CONSTRAINT PK_JURNAL_UMUM_DETAIL PRIMARY KEY (id));

-- changeset liquibase:1794384377701-110 splitStatements:false
CREATE TABLE kategori_pelanggaran (id INT AUTO_INCREMENT NOT NULL, kategori TEXT NOT NULL, CONSTRAINT PK_KATEGORI_PELANGGARAN PRIMARY KEY (id));

-- changeset liquibase:1794384377701-111 splitStatements:false
CREATE TABLE kategori_prestasi (id INT AUTO_INCREMENT NOT NULL, kategori TEXT NOT NULL, CONSTRAINT PK_KATEGORI_PRESTASI PRIMARY KEY (id));

-- changeset liquibase:1794384377701-112 splitStatements:false
CREATE TABLE kegiatan (kegiatan_id INT AUTO_INCREMENT NOT NULL, kegiatan_name VARCHAR(45) NULL, kegiatan_majors_id INT NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_KEGIATAN PRIMARY KEY (kegiatan_id));

-- changeset liquibase:1794384377701-113 splitStatements:false
CREATE TABLE keterangan_lampiran (lampiran_id INT AUTO_INCREMENT NOT NULL, lampiran_isi TEXT NOT NULL, lampiran_surat_keterangan_id INT NOT NULL, lampiran_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_KETERANGAN_LAMPIRAN PRIMARY KEY (lampiran_id));

-- changeset liquibase:1794384377701-114 splitStatements:false
CREATE TABLE kitab (kitab_id INT AUTO_INCREMENT NOT NULL, kitab_name TEXT NOT NULL, CONSTRAINT PK_KITAB PRIMARY KEY (kitab_id));

-- changeset liquibase:1794384377701-115 splitStatements:false
CREATE TABLE kode_pengisian (kode_pengisian_id INT AUTO_INCREMENT NOT NULL, kode_pengisian_name VARCHAR(225) NOT NULL, kode_pengisian_keterangan TEXT NOT NULL, kode_pengisian_date datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_KODE_PENGISIAN PRIMARY KEY (kode_pengisian_id));

-- changeset liquibase:1794384377701-116 splitStatements:false
CREATE TABLE lainnya_guru (lainnya_guru_id INT AUTO_INCREMENT NOT NULL, lainnya_guru_no VARCHAR(225) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_LAINNYA_GURU PRIMARY KEY (lainnya_guru_id));

-- changeset liquibase:1794384377701-117 splitStatements:false
CREATE TABLE lainnya_siswa (lainnya_siswa_id INT AUTO_INCREMENT NOT NULL, lainnya_siswa_no VARCHAR(225) NOT NULL, student_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_LAINNYA_SISWA PRIMARY KEY (lainnya_siswa_id));

-- changeset liquibase:1794384377701-118 splitStatements:false
CREATE TABLE layanan_publik (layanan_publik_id INT AUTO_INCREMENT NOT NULL, layanan_nama VARCHAR(225) NOT NULL, layanan_order INT NOT NULL, layanan_submenu INT NOT NULL, layanan_link VARCHAR(225) NOT NULL, CONSTRAINT PK_LAYANAN_PUBLIK PRIMARY KEY (layanan_publik_id));

-- changeset liquibase:1794384377701-119 splitStatements:false
CREATE TABLE list_tamu (list_tamu_id INT AUTO_INCREMENT NOT NULL, list_tamu_kode TEXT NOT NULL, list_tamu_guest_id INT NOT NULL, CONSTRAINT PK_LIST_TAMU PRIMARY KEY (list_tamu_id));

-- changeset liquibase:1794384377701-120 splitStatements:false
CREATE TABLE log_error_mobile (error_id INT AUTO_INCREMENT NOT NULL, student_id VARCHAR(50) NULL, pesan_error TEXT NOT NULL, nama_menu_error VARCHAR(255) NOT NULL, line VARCHAR(50) NULL, platform VARCHAR(50) NULL, device VARCHAR(50) NULL, created_at datetime(0) NULL, CONSTRAINT PK_LOG_ERROR_MOBILE PRIMARY KEY (error_id));

-- changeset liquibase:1794384377701-121 splitStatements:false
CREATE TABLE log_tf (log_tf_id INT AUTO_INCREMENT NOT NULL, log_tf_kredit_id INT NULL, log_tf_debit_id INT NULL, log_tf_account_id INT NOT NULL, log_tf_balance_id TEXT NULL, log_tf_date date NOT NULL, log_tf_note TEXT NOT NULL, log_tf_majors_id INT NOT NULL, log_tf_user_id INT NOT NULL, log_tf_input_date timestamp(0) DEFAULT NOW() NOT NULL, log_tf_last_update timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_LOG_TF PRIMARY KEY (log_tf_id));

-- changeset liquibase:1794384377701-122 splitStatements:false
CREATE TABLE menu_paket (menu_paket_id INT AUTO_INCREMENT NOT NULL, navmenu_menu_id INT NULL, package_package_id INT NULL, CONSTRAINT PK_MENU_PAKET PRIMARY KEY (menu_paket_id));

-- changeset liquibase:1794384377701-123 splitStatements:false
CREATE TABLE mitra (mitra_id INT AUTO_INCREMENT NOT NULL, mitra_name VARCHAR(100) NOT NULL, mitra_note VARCHAR(200) NOT NULL, mitra_created_date datetime(0) DEFAULT NOW() NOT NULL, mitra_updated_date datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_MITRA PRIMARY KEY (mitra_id));

-- changeset liquibase:1794384377701-124 splitStatements:false
CREATE TABLE nadhoman (nadhoman_id INT AUTO_INCREMENT NOT NULL, nadhoman_period_id INT NOT NULL, nadhoman_kitab_id INT NOT NULL, nadhoman_student_id INT NOT NULL, nadhoman_date date NULL, nadhoman_new TEXT NULL, nadhoman_note TEXT NULL, nadhoman_user_id INT NOT NULL, nadhoman_input_date timestamp(0) DEFAULT NOW() NOT NULL, nadhoman_last_update timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_NADHOMAN PRIMARY KEY (nadhoman_id));

-- changeset liquibase:1794384377701-125 splitStatements:false
CREATE TABLE pelanggaran (id INT AUTO_INCREMENT NOT NULL, pelanggaran TEXT NOT NULL, id_kategori TINYINT(3) NOT NULL, poin SMALLINT NOT NULL, CONSTRAINT PK_PELANGGARAN PRIMARY KEY (id));

-- changeset liquibase:1794384377701-126 splitStatements:false
CREATE TABLE pelayanan (id INT AUTO_INCREMENT NOT NULL, img TEXT NULL, title VARCHAR(200) NULL, link TEXT NULL, CONSTRAINT PK_PELAYANAN PRIMARY KEY (id));

-- changeset liquibase:1794384377701-127 splitStatements:false
CREATE TABLE pendayagunaan (pendayagunaan_id INT AUTO_INCREMENT NOT NULL, program_program_id INT NOT NULL, pendayagunaan_title VARCHAR(100) NOT NULL, pendayagunaan_nominal INT DEFAULT 0 NOT NULL, pendayagunaan_note TEXT NOT NULL, pendayagunaan_date date NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_PENDAYAGUNAAN PRIMARY KEY (pendayagunaan_id));

-- changeset liquibase:1794384377701-128 splitStatements:false
CREATE TABLE pengaduan (pengaduan_id INT AUTO_INCREMENT NOT NULL, pengaduan_no VARCHAR(255) NOT NULL, pengaduan_nama INT NOT NULL, pengaduan_tujuan INT NOT NULL, pengaduan_detail TEXT NOT NULL, pengaduan_status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_PENGADUAN PRIMARY KEY (pengaduan_id));

-- changeset liquibase:1794384377701-129 splitStatements:false
CREATE TABLE pengajuan_izin (pengajuan_izin_id INT AUTO_INCREMENT NOT NULL, pengajuan_izin_date date NOT NULL, pengajuan_izin_time TEXT NOT NULL, pengajuan_izin_period_id INT NOT NULL, pengajuan_izin_majors_id INT NOT NULL, pengajuan_izin_student_id INT NOT NULL, pengajuan_izin_note TEXT NOT NULL, pengajuan_izin_status VARCHAR(50) NULL, pengajuan_izin_user_id INT NULL, pengajuan_izin_created_at datetime(0) DEFAULT NOW() NULL, pengajuan_izin_updated_at datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_PENGAJUAN_IZIN PRIMARY KEY (pengajuan_izin_id));

-- changeset liquibase:1794384377701-130 splitStatements:false
CREATE TABLE pengajuan_pulang (pengajuan_pulang_id INT AUTO_INCREMENT NOT NULL, pengajuan_pulang_date date NOT NULL, pengajuan_pulang_days INT NOT NULL, pengajuan_pulang_period_id INT NOT NULL, pengajuan_pulang_majors_id INT NOT NULL, pengajuan_pulang_student_id INT NOT NULL, pengajuan_pulang_note TEXT NOT NULL, pengajuan_pulang_status VARCHAR(50) NOT NULL, pengajuan_pulang_user_id INT NULL, pengajuan_pulang_created_at datetime(0) DEFAULT NOW() NULL, pengajuan_pulang_updated_at datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_PENGAJUAN_PULANG PRIMARY KEY (pengajuan_pulang_id));

-- changeset liquibase:1794384377701-131 splitStatements:false
CREATE TABLE pengajuan_surat_masuk (id_pengajuan_s INT AUTO_INCREMENT NOT NULL, no_agenda VARCHAR(15) NOT NULL, jenis_surat VARCHAR(15) NOT NULL, tanggal_kirim datetime(0) NOT NULL, tanggal_terima datetime(0) NOT NULL, no_surat VARCHAR(50) NOT NULL, pengirim VARCHAR(50) NOT NULL, perihal VARCHAR(50) NOT NULL, nama_file VARCHAR(50) NOT NULL, CONSTRAINT PK_PENGAJUAN_SURAT_MASUK PRIMARY KEY (id_pengajuan_s));

-- changeset liquibase:1794384377701-132 splitStatements:false
CREATE TABLE peserta_halaqoh (peserta_id INT AUTO_INCREMENT NOT NULL, peserta_student_id INT NOT NULL, peserta_group_id INT NOT NULL, peserta_input_date datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_PESERTA_HALAQOH PRIMARY KEY (peserta_id));

-- changeset liquibase:1794384377701-133 splitStatements:false
CREATE TABLE pos_debit (pos_debit_id INT AUTO_INCREMENT NOT NULL, pos_debit_account_id INT NULL, pos_debit_item_id INT NULL, CONSTRAINT PK_POS_DEBIT PRIMARY KEY (pos_debit_id));

-- changeset liquibase:1794384377701-134 splitStatements:false
CREATE TABLE pos_kredit (pos_kredit_id INT AUTO_INCREMENT NOT NULL, pos_kredit_account_id INT NULL, pos_kredit_item_id INT NULL, CONSTRAINT PK_POS_KREDIT PRIMARY KEY (pos_kredit_id));

-- changeset liquibase:1794384377701-135 splitStatements:false
CREATE TABLE potongan_setting (potongan_setting_id BIGINT AUTO_INCREMENT NOT NULL, potongan_setting_name VARCHAR(225) NULL, potongan_setting_default_id INT NULL, potongan_setting_nominal INT DEFAULT 0 NULL, potongan_setting_employee_id INT NULL, potongan_setting_date_input datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_POTONGAN_SETTING PRIMARY KEY (potongan_setting_id));

-- changeset liquibase:1794384377701-136 splitStatements:false
CREATE TABLE potongan_slip (potongan_slip_id BIGINT AUTO_INCREMENT NOT NULL, potongan_slip_name VARCHAR(225) NULL, potongan_slip_setting_id INT NULL, potongan_slip_nominal INT NULL, potongan_slip_gaji_id INT NULL, potongan_slip_date_input datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_POTONGAN_SLIP PRIMARY KEY (potongan_slip_id));

-- changeset liquibase:1794384377701-137 splitStatements:false
CREATE TABLE presensi_halaqoh (presensi_halaqoh_id BIGINT AUTO_INCREMENT NOT NULL, presensi_halaqoh_halaqoh_id INT NULL, presensi_halaqoh_kegiatan_id INT NOT NULL, presensi_halaqoh_teaching_id INT NULL, presensi_halaqoh_month_id INT NOT NULL, presensi_halaqoh_date date NULL, presensi_halaqoh_student_id INT NULL, presensi_halaqoh_tahun VARCHAR(11) NOT NULL, presensi_halaqoh_period_id INT NOT NULL, presensi_halaqoh_status CHAR(2) NULL, presensi_halaqoh_created_date timestamp(0) DEFAULT NOW() NULL, presensi_halaqoh_updated_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_PRESENSI_HALAQOH PRIMARY KEY (presensi_halaqoh_id));

-- changeset liquibase:1794384377701-138 splitStatements:false
CREATE TABLE prestasi (id INT AUTO_INCREMENT NOT NULL, prestasi TEXT NOT NULL, id_kategori TINYINT(3) NOT NULL, poin SMALLINT NOT NULL, CONSTRAINT PK_PRESTASI PRIMARY KEY (id));

-- changeset liquibase:1794384377701-139 splitStatements:false
CREATE TABLE program (program_id INT AUTO_INCREMENT NOT NULL, program_name VARCHAR(100) NULL, program_description VARCHAR(100) NULL, account_account_id CHAR(10) NOT NULL, pendayagunaan_account_id INT NULL, program_gambar TEXT NULL, program_end date NOT NULL, program_target INT NOT NULL, program_earn INT DEFAULT 0 NULL, program_realisasi INT DEFAULT 0 NULL, program_status INT NOT NULL, program_created_at timestamp(0) DEFAULT NOW() NOT NULL, program_updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_PROGRAM PRIMARY KEY (program_id));

-- changeset liquibase:1794384377701-140 splitStatements:false
CREATE TABLE publik (publik_id INT AUTO_INCREMENT NOT NULL, publik_no VARCHAR(50) NOT NULL, publik_nama VARCHAR(225) NOT NULL, publik_alamat VARCHAR(255) NOT NULL, publik_telepon VARCHAR(50) NOT NULL, publik_nik VARCHAR(25) NOT NULL, publik_position_id INT NOT NULL, keperluan TEXT NOT NULL, publik_status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_PUBLIK PRIMARY KEY (publik_id));

-- changeset liquibase:1794384377701-141 splitStatements:false
CREATE TABLE reservasi (reservasi_id INT AUTO_INCREMENT NOT NULL, reservasi_checkin date NULL, reservasi_checkout date NULL, reservasi_harga DOUBLE DEFAULT 0 NOT NULL, reservasi_total DOUBLE DEFAULT 0 NOT NULL, reservasi_status ENUM('RESERVASI', 'PAID', 'CHECKIN', 'CHECKOUT', 'CANCEL') DEFAULT 'RESERVASI' NULL, reservasi_create_at timestamp(0) DEFAULT NOW() NULL, reservasi_update_at timestamp(0) DEFAULT NOW() NULL, reservasi_ref_id VARCHAR(50) NOT NULL, reservasi_name VARCHAR(50) NOT NULL, reservasi_hp VARCHAR(50) NOT NULL, reservasi_homestay_id INT NOT NULL, CONSTRAINT PK_RESERVASI PRIMARY KEY (reservasi_id));

-- changeset liquibase:1794384377701-142 splitStatements:false
CREATE TABLE satuan (satuan_id INT AUTO_INCREMENT NOT NULL, satuan_name VARCHAR(100) NULL, CONSTRAINT PK_SATUAN PRIMARY KEY (satuan_id));

-- changeset liquibase:1794384377701-143 splitStatements:false
CREATE TABLE satuan_barang (satuan_barang_id INT AUTO_INCREMENT NOT NULL, nama_satuan VARCHAR(30) NOT NULL, keterangan VARCHAR(100) NOT NULL, CONSTRAINT PK_SATUAN_BARANG PRIMARY KEY (satuan_barang_id));

-- changeset liquibase:1794384377701-144 splitStatements:false
CREATE TABLE siswa_ket_aktif (siswa_ket_aktif_id INT AUTO_INCREMENT NOT NULL, siswa_ket_aktif_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, keperluan VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_KET_AKTIF PRIMARY KEY (siswa_ket_aktif_id));

-- changeset liquibase:1794384377701-145 splitStatements:false
CREATE TABLE siswa_ket_baik (siswa_ket_baik_id INT AUTO_INCREMENT NOT NULL, siswa_ket_baik_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, keperluan VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_KET_BAIK PRIMARY KEY (siswa_ket_baik_id));

-- changeset liquibase:1794384377701-146 splitStatements:false
CREATE TABLE siswa_mutasi (siswa_mutasi_id INT AUTO_INCREMENT NOT NULL, siswa_mutasi_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, catatan VARCHAR(225) NOT NULL, sekolah_tujuan VARCHAR(225) NOT NULL, alamat_sekolah_tujuan TEXT NOT NULL, alasan_pindah TEXT NOT NULL, file VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_MUTASI PRIMARY KEY (siswa_mutasi_id));

-- changeset liquibase:1794384377701-147 splitStatements:false
CREATE TABLE siswa_penelitian (siswa_penelitian_id INT AUTO_INCREMENT NOT NULL, siswa_penelitian_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, anggota_id VARCHAR(225) NOT NULL, nama_kegiatan VARCHAR(225) NOT NULL, nama_instansi VARCHAR(225) NOT NULL, alamat_instansi TEXT NOT NULL, tanggal_mulai date NOT NULL, tanggal_akhir date NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_PENELITIAN PRIMARY KEY (siswa_penelitian_id));

-- changeset liquibase:1794384377701-148 splitStatements:false
CREATE TABLE siswa_prestasi (siswa_prestasi_id INT AUTO_INCREMENT NOT NULL, siswa_prestasi_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, tujuan VARCHAR(225) NOT NULL, jenis VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_PRESTASI PRIMARY KEY (siswa_prestasi_id));

-- changeset liquibase:1794384377701-149 splitStatements:false
CREATE TABLE siswa_rekomendasi (siswa_rekomendasi_id INT AUTO_INCREMENT NOT NULL, siswa_rekomendasi_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, keperluan VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, file VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_REKOMENDASI PRIMARY KEY (siswa_rekomendasi_id));

-- changeset liquibase:1794384377701-150 splitStatements:false
CREATE TABLE siswa_surat_lain (siswa_surat_lain_id INT AUTO_INCREMENT NOT NULL, siswa_surat_lain_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, tujuan VARCHAR(225) NOT NULL, ditujukan VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, file VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_SURAT_LAIN PRIMARY KEY (siswa_surat_lain_id));

-- changeset liquibase:1794384377701-151 splitStatements:false
CREATE TABLE sppd (id_sppd INT AUTO_INCREMENT NOT NULL, no_sppd VARCHAR(225) NOT NULL, perintah_id INT NOT NULL, deskripsi TEXT NOT NULL, transportasi VARCHAR(225) NOT NULL, tmp_berangkat VARCHAR(225) NOT NULL, tmp_tujuan VARCHAR(225) NOT NULL, tgl_berangkat date NOT NULL, tgl_kembali date NOT NULL, lama_perjalanan VARCHAR(11) NOT NULL, diperintah_id INT NOT NULL, anggota_id VARCHAR(225) NOT NULL, instansi_anggaran VARCHAR(225) NOT NULL, mata_anggaran VARCHAR(50) NOT NULL, dasar_surat VARCHAR(100) NOT NULL, keterangan TEXT NOT NULL, id_users INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SPPD PRIMARY KEY (id_sppd));

-- changeset liquibase:1794384377701-152 splitStatements:false
CREATE TABLE standar (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, standar_majors_id INT NOT NULL, CONSTRAINT PK_STANDAR PRIMARY KEY (id));

-- changeset liquibase:1794384377701-153 splitStatements:false
CREATE TABLE surat_cuti (surat_cuti_id INT AUTO_INCREMENT NOT NULL, surat_cuti_no VARCHAR(225) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_SURAT_CUTI PRIMARY KEY (surat_cuti_id));

-- changeset liquibase:1794384377701-154 splitStatements:false
CREATE TABLE surat_dispensasi (dispensasi_id INT AUTO_INCREMENT NOT NULL, dispensasi_nomor_surat_id VARCHAR(50) NOT NULL, dispensasi_desc TEXT NOT NULL, dispensasi_student_pj INT NOT NULL, dispensasi_student_id VARCHAR(225) NOT NULL, dispensasi_date date NOT NULL, dispensasi_time_start VARCHAR(25) NOT NULL, dispensasi_time_end VARCHAR(25) NOT NULL, dispensasi_lokasi VARCHAR(225) NOT NULL, dispensasi_users INT NOT NULL, dispensasi_input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_DISPENSASI PRIMARY KEY (dispensasi_id));

-- changeset liquibase:1794384377701-155 splitStatements:false
CREATE TABLE surat_jenis (id_jenis INT AUTO_INCREMENT NOT NULL, nama_jenis VARCHAR(50) NOT NULL, id_user VARCHAR(12) NOT NULL, kode_surat VARCHAR(40) NOT NULL, tanggal_create date NOT NULL, CONSTRAINT PK_SURAT_JENIS PRIMARY KEY (id_jenis));

-- changeset liquibase:1794384377701-156 splitStatements:false
CREATE TABLE surat_keterangan (keterangan_id INT AUTO_INCREMENT NOT NULL, keterangan_nomor_surat VARCHAR(50) NOT NULL, keterangan_student_id INT NOT NULL, keterangan_jenis INT NOT NULL, keterangan_users INT NOT NULL, keterangan_input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_KETERANGAN PRIMARY KEY (keterangan_id));

-- changeset liquibase:1794384377701-157 splitStatements:false
CREATE TABLE surat_lain_guru (surat_lain_guru_id INT AUTO_INCREMENT NOT NULL, surat_lain_guru_no VARCHAR(225) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_SURAT_LAIN_GURU PRIMARY KEY (surat_lain_guru_id));

-- changeset liquibase:1794384377701-158 splitStatements:false
CREATE TABLE surat_mengajar (surat_mengajar_id INT AUTO_INCREMENT NOT NULL, surat_mengajar_no VARCHAR(225) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_SURAT_MENGAJAR PRIMARY KEY (surat_mengajar_id));

-- changeset liquibase:1794384377701-159 splitStatements:false
CREATE TABLE surat_nomor (nomor_surat VARCHAR(50) NOT NULL, tahun VARCHAR(225) NOT NULL, input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_NOMOR PRIMARY KEY (nomor_surat));

-- changeset liquibase:1794384377701-160 splitStatements:false
CREATE TABLE surat_rekomendasi (rekomendasi_id INT AUTO_INCREMENT NOT NULL, rekomendasi_nomor_surat_id VARCHAR(50) NOT NULL, rekomendasi_desc TEXT NOT NULL, rekomendasi_student_id VARCHAR(225) NOT NULL, rekomendasi_date_start date NOT NULL, rekomendasi_date_end date NOT NULL, rekomendasi_time_start VARCHAR(25) NOT NULL, rekomendasi_time_end VARCHAR(25) NOT NULL, rekomendasi_lokasi VARCHAR(225) NOT NULL, rekomendasi_users INT NOT NULL, rekomendasi_input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_REKOMENDASI PRIMARY KEY (rekomendasi_id));

-- changeset liquibase:1794384377701-161 splitStatements:false
CREATE TABLE surat_tugas (id_surat_tugas INT AUTO_INCREMENT NOT NULL, no_surat_tugas VARCHAR(225) NOT NULL, employee_id INT NOT NULL, pengikut_id VARCHAR(225) NOT NULL, deskripsi TEXT NOT NULL, tgl_kegiatan date NOT NULL, tmp_kegiatan VARCHAR(225) NOT NULL, alamat_kegiatan VARCHAR(225) NOT NULL, keterangan TEXT NOT NULL, file VARCHAR(50) NOT NULL, status_surat INT NOT NULL, id_users INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_TUGAS PRIMARY KEY (id_surat_tugas));

-- changeset liquibase:1794384377701-162 splitStatements:false
CREATE TABLE survei (survei_id INT AUTO_INCREMENT NOT NULL, survei_nama VARCHAR(225) NOT NULL, survei_alamat TEXT NOT NULL, survei_respon INT NOT NULL, survei_catatan TEXT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURVEI PRIMARY KEY (survei_id));

-- changeset liquibase:1794384377701-163 splitStatements:false
CREATE TABLE tbl_disposisi (id_disposisi INT AUTO_INCREMENT NOT NULL, tujuan VARCHAR(250) NOT NULL, isi_disposisi MEDIUMTEXT NOT NULL, sifat VARCHAR(100) NOT NULL, batas_waktu date NOT NULL, catatan VARCHAR(250) NOT NULL, id_surat INT NOT NULL, id_user TINYINT(3) NOT NULL, CONSTRAINT PK_TBL_DISPOSISI PRIMARY KEY (id_disposisi));

-- changeset liquibase:1794384377701-164 splitStatements:false
CREATE TABLE tbl_group (group_id INT AUTO_INCREMENT NOT NULL, group_name VARCHAR(75) NOT NULL, group_kegiatan_id INT NULL, group_date date NULL, group_tempat VARCHAR(225) NULL, group_keterangan TEXT NULL, group_input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_TBL_GROUP PRIMARY KEY (group_id));

-- changeset liquibase:1794384377701-165 splitStatements:false
CREATE TABLE tbl_surat_keluar (id_surat INT AUTO_INCREMENT NOT NULL, id_jenis_surat VARCHAR(50) NOT NULL, tujuan VARCHAR(250) NOT NULL, no_surat VARCHAR(50) NOT NULL, isi MEDIUMTEXT NOT NULL, kode VARCHAR(30) NOT NULL, tgl_surat date NOT NULL, tgl_catat date NOT NULL, file VARCHAR(250) NOT NULL, keterangan VARCHAR(250) NOT NULL, id_user TINYINT(3) NOT NULL, no_agenda VARCHAR(50) NOT NULL, CONSTRAINT PK_TBL_SURAT_KELUAR PRIMARY KEY (id_surat));

-- changeset liquibase:1794384377701-166 splitStatements:false
CREATE TABLE tbl_surat_masuk (id_surat INT AUTO_INCREMENT NOT NULL, no_agenda INT NOT NULL, no_surat VARCHAR(50) NOT NULL, asal_surat VARCHAR(250) NOT NULL, isi MEDIUMTEXT NOT NULL, kode VARCHAR(30) NOT NULL, indeks VARCHAR(30) NOT NULL, tgl_surat date NOT NULL, tgl_diterima date NOT NULL, file VARCHAR(250) NULL, keterangan VARCHAR(250) NOT NULL, id_user TINYINT(3) NOT NULL, disposisi ENUM('n', 'y') NOT NULL, CONSTRAINT PK_TBL_SURAT_MASUK PRIMARY KEY (id_surat));

-- changeset liquibase:1794384377701-167 splitStatements:false
CREATE TABLE teaching_halaqoh (teaching_halaqoh_id INT AUTO_INCREMENT NOT NULL, teaching_halaqoh_employee_id INT NOT NULL, teaching_halaqoh_halaqoh_id INT NOT NULL, teaching_halaqoh_kegiatan_id INT NOT NULL, teaching_halaqoh_month_id INT NOT NULL, teaching_halaqoh_tahun VARCHAR(225) NOT NULL, teaching_halaqoh_materi TEXT NOT NULL, teaching_halaqoh_date date NULL, teaching_date_create timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_TEACHING_HALAQOH PRIMARY KEY (teaching_halaqoh_id));

-- changeset liquibase:1794384377701-168 splitStatements:false
CREATE TABLE visit (visit_id INT AUTO_INCREMENT NOT NULL, visit_date date NOT NULL, visit_time TEXT NOT NULL, visit_note TEXT NOT NULL, visit_period_id INT NOT NULL, visit_student_id INT NOT NULL, visit_guest_list_code TEXT NOT NULL, visit_user_id INT NOT NULL, CONSTRAINT PK_VISIT PRIMARY KEY (visit_id));

-- changeset liquibase:1794384377701-169 splitStatements:false
CREATE TABLE worksheet (worksheet_id INT AUTO_INCREMENT NOT NULL, worksheet_majors_id INT NOT NULL, worksheet_period_id INT NOT NULL, worksheet_nama_kepsek VARCHAR(100) NOT NULL, worksheet_nama_bendahara VARCHAR(100) NOT NULL, worksheet_nama_komite VARCHAR(100) NOT NULL, worksheet_nip_kepsek VARCHAR(100) NOT NULL, worksheet_nip_bendahara VARCHAR(100) NOT NULL, worksheet_email_komite VARCHAR(100) NOT NULL, worksheet_nominal FLOAT(12) NOT NULL, worksheet_status ENUM('A', 'B', 'TS', 'S', 'D') DEFAULT 'B' NOT NULL, worksheet_created_at timestamp(0) DEFAULT NOW() NOT NULL, worksheet_updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_WORKSHEET PRIMARY KEY (worksheet_id));

-- changeset liquibase:1794384377701-170 splitStatements:false
ALTER TABLE class ADD grade_grade_id INT NOT NULL;

-- changeset liquibase:1794384377701-171 splitStatements:false
ALTER TABLE potongan ADD potongan_tabungan INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-172 splitStatements:false
ALTER TABLE premier ADD premier_jabatan INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-173 splitStatements:false
ALTER TABLE subsatu ADD subsatu_jabatan INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-174 splitStatements:false
ALTER TABLE subtiga ADD subtiga_tabungan INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-175 splitStatements:false
ALTER TABLE izin ADD izin_catatan TEXT NULL;

-- changeset liquibase:1794384377701-176 splitStatements:false
ALTER TABLE student_token ADD jwt_token VARCHAR(255) NOT NULL;

-- changeset liquibase:1794384377701-177 splitStatements:false
ALTER TABLE premier ADD premier_masa_kerja INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-178 splitStatements:false
ALTER TABLE subsatu ADD subsatu_masa_kerja INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-179 splitStatements:false
ALTER TABLE guest_list ADD guest_list_note TEXT NOT NULL;

-- changeset liquibase:1794384377701-180 splitStatements:false
ALTER TABLE izin ADD izin_note TEXT NOT NULL;

-- changeset liquibase:1794384377701-181 splitStatements:false
ALTER TABLE madin ADD musyrif_id INT NULL;

-- changeset liquibase:1794384377701-182 splitStatements:false
ALTER TABLE potongan ADD potongan_zakat INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-183 splitStatements:false
ALTER TABLE saldo_awal ADD saldo_awal_nominal BIGINT DEFAULT 0 NOT NULL;

-- changeset liquibase:1794384377701-184 splitStatements:false
ALTER TABLE subtiga ADD subtiga_zakat INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-185 splitStatements:false
ALTER TABLE account ADD account_status INT DEFAULT 1 NOT NULL;

-- changeset liquibase:1794384377701-186 splitStatements:false
ALTER TABLE konseling ADD pelanggaran_id SMALLINT DEFAULT 0 NOT NULL;

-- changeset liquibase:1794384377701-187 splitStatements:false
ALTER TABLE premier ADD premier_bpjs INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-188 splitStatements:false
ALTER TABLE subsatu ADD subsatu_bpjs INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-189 splitStatements:false
ALTER TABLE gaji ADD gaji_catatan TEXT NOT NULL;

-- changeset liquibase:1794384377701-190 splitStatements:false
ALTER TABLE navmenu ADD menu_status INT DEFAULT 0 NOT NULL;

-- changeset liquibase:1794384377701-191 splitStatements:false
ALTER TABLE premier ADD premier_yayasan INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-192 splitStatements:false
ALTER TABLE konseling ADD prestasi_id SMALLINT DEFAULT 0 NOT NULL;

-- changeset liquibase:1794384377701-193 splitStatements:false
ALTER TABLE subsatu ADD subsatu_yayasan INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-194 splitStatements:false
ALTER TABLE alumni ADD alumni_password TEXT NULL;

-- changeset liquibase:1794384377701-195 splitStatements:false
ALTER TABLE izin ADD izin_status INT DEFAULT 1 NOT NULL;

-- changeset liquibase:1794384377701-196 splitStatements:false
ALTER TABLE premier ADD premier_kegiatan INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-197 splitStatements:false
ALTER TABLE subsatu ADD subsatu_kegiatan INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-198 splitStatements:false
ALTER TABLE premier ADD premier_koperasi INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-199 splitStatements:false
ALTER TABLE subsatu ADD subsatu_koperasi INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-200 splitStatements:false
ALTER TABLE konseling ADD bukti VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-201 splitStatements:false
ALTER TABLE premier ADD premier_mengajar_mi INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-202 splitStatements:false
ALTER TABLE subsatu ADD subsatu_mengajar_mi INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-203 splitStatements:false
ALTER TABLE banking ADD ipaymu_no_trans VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-204 splitStatements:false
ALTER TABLE premier ADD premier_mengajar_mts INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-205 splitStatements:false
ALTER TABLE subsatu ADD subsatu_mengajar_mts INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-206 splitStatements:false
ALTER TABLE bebas_pay ADD ipaymu_no_trans VARCHAR(100) NULL;

-- changeset liquibase:1794384377701-207 splitStatements:false
ALTER TABLE banking ADD ipaymu_status VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-208 splitStatements:false
ALTER TABLE konseling ADD konseling_mode ENUM('PELANGGARAN', 'KONSULTASI', 'PRESTASI') NULL;

-- changeset liquibase:1794384377701-209 splitStatements:false
ALTER TABLE premier ADD premier_mengajar_pondok INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-210 splitStatements:false
ALTER TABLE subsatu ADD subsatu_mengajar_pondok INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-211 splitStatements:false
ALTER TABLE banking ADD flip_no_trans VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-212 splitStatements:false
ALTER TABLE bebas_pay ADD ipaymu_status VARCHAR(100) NULL;

-- changeset liquibase:1794384377701-213 splitStatements:false
ALTER TABLE premier ADD premier_tambahan_guru INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-214 splitStatements:false
ALTER TABLE subsatu ADD subsatu_tambahan_guru INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-215 splitStatements:false
ALTER TABLE bebas_pay ADD flip_no_trans VARCHAR(100) NULL;

-- changeset liquibase:1794384377701-216 splitStatements:false
ALTER TABLE banking ADD flip_status VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-217 splitStatements:false
ALTER TABLE premier ADD premier_tambahan_mengajar INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-218 splitStatements:false
ALTER TABLE subsatu ADD subsatu_tambahan_mengajar INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-219 splitStatements:false
ALTER TABLE banking ADD banking_status INT NULL;

-- changeset liquibase:1794384377701-220 splitStatements:false
ALTER TABLE bebas_pay ADD flip_status VARCHAR(100) NULL;

-- changeset liquibase:1794384377701-221 splitStatements:false
ALTER TABLE bulan ADD ipaymu_no_trans VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-222 splitStatements:false
ALTER TABLE premier ADD premier_pj_bos INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-223 splitStatements:false
ALTER TABLE subsatu ADD subsatu_pj_bos INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-224 splitStatements:false
ALTER TABLE bulan ADD ipaymu_status VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-225 splitStatements:false
ALTER TABLE premier ADD premier_pj_bop INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-226 splitStatements:false
ALTER TABLE subsatu ADD subsatu_pj_bop INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-227 splitStatements:false
ALTER TABLE bulan ADD flip_no_trans VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-228 splitStatements:false
ALTER TABLE premier ADD premier_rutin INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-229 splitStatements:false
ALTER TABLE subsatu ADD subsatu_rutin INT DEFAULT 0 NULL;

-- changeset liquibase:1794384377701-230 splitStatements:false
ALTER TABLE alumni ADD alumni_madin VARCHAR(100) NULL;

-- changeset liquibase:1794384377701-231 splitStatements:false
ALTER TABLE bulan ADD flip_status VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-232 splitStatements:false
ALTER TABLE student ADD student_halaqoh INT NOT NULL;

-- changeset liquibase:1794384377701-233 splitStatements:false
ALTER TABLE settinghutang ADD CONSTRAINT settinghutang_period_id UNIQUE (settinghutang_period_id);

-- changeset liquibase:1794384377701-234 splitStatements:false
ALTER TABLE student ADD CONSTRAINT student_nis UNIQUE (student_nis);

-- changeset liquibase:1794384377701-235 splitStatements:false
ALTER TABLE halaqoh_group ADD CONSTRAINT unique_halaqoh_group UNIQUE (halaqoh_group_student_id, halaqoh_group_group_id);

-- changeset liquibase:1794384377701-236 splitStatements:false
CREATE INDEX FK_bmt_data_absensi_area_absensi ON data_absensi_pengasuh(area_absen);

-- changeset liquibase:1794384377701-237 splitStatements:false
CREATE INDEX REFNO_PYMTDATE_VANO ON bmi_refersal(REFNO, PYMTDATE, VANO);

-- changeset liquibase:1794384377701-238 splitStatements:false
CREATE INDEX TRXDATE_REFNO_VANO ON bmi_payment(TRXDATE, REFNO, VANO);

-- changeset liquibase:1794384377701-239 splitStatements:false
CREATE INDEX bulan ON data_absensi_pengasuh(bulan);

-- changeset liquibase:1794384377701-240 splitStatements:false
CREATE INDEX fk_anggaran_account1_idx ON anggaran(anggaran_account_id);

-- changeset liquibase:1794384377701-241 splitStatements:false
CREATE INDEX fk_anggaran_period1_idx ON anggaran(anggaran_period_id);

-- changeset liquibase:1794384377701-242 splitStatements:false
CREATE INDEX fk_bebas_pay_bebas1_idx ON bebas_pay_mobile(bebas_bebas_id);

-- changeset liquibase:1794384377701-243 splitStatements:false
CREATE INDEX fk_bebas_pay_users1_idx ON bebas_pay_mobile(user_user_id);

-- changeset liquibase:1794384377701-244 splitStatements:false
CREATE INDEX id_jurnal ON jurnal_umum_detail(id_jurnal);

-- changeset liquibase:1794384377701-245 splitStatements:false
CREATE INDEX id_pegawai ON data_absensi_pengasuh(id_pegawai);

-- changeset liquibase:1794384377701-246 splitStatements:false
CREATE INDEX idx_student_id ON log_error_mobile(student_id);

-- changeset liquibase:1794384377701-247 splitStatements:false
CREATE INDEX kode_akun ON jurnal_umum_detail(account_code);

-- changeset liquibase:1794384377701-248 splitStatements:false
CREATE INDEX status ON bmi_transaksi(status);

-- changeset liquibase:1794384377701-249 splitStatements:false
CREATE INDEX status ON flip_donasi(status);

-- changeset liquibase:1794384377701-250 splitStatements:false
CREATE INDEX status ON flip_penginapan(status);

-- changeset liquibase:1794384377701-251 splitStatements:false
CREATE INDEX status ON flip_transaksi(status);

-- changeset liquibase:1794384377701-252 splitStatements:false
CREATE INDEX status ON flip_transaksi_tabungan(status);

-- changeset liquibase:1794384377701-253 splitStatements:false
CREATE INDEX status ON ipaymu_donasi(status);

-- changeset liquibase:1794384377701-254 splitStatements:false
CREATE INDEX status ON ipaymu_penginapan(status);

-- changeset liquibase:1794384377701-255 splitStatements:false
CREATE INDEX status ON ipaymu_transaksi(status);

-- changeset liquibase:1794384377701-256 splitStatements:false
CREATE INDEX status ON ipaymu_transaksi_tabungan(status);

-- changeset liquibase:1794384377701-257 splitStatements:false
CREATE INDEX tanggal ON data_absensi_pengasuh(tanggal);

-- changeset liquibase:1794384377701-258 splitStatements:false
CREATE INDEX time ON data_absensi_pengasuh(time);

-- changeset liquibase:1794384377701-259 splitStatements:false
CREATE VIEW empl_kop_ang AS select `a`.`employee_id` AS `employee_id`,`a`.`employee_nip` AS `employee_nip`,`a`.`employee_gender` AS `employee_gender`,`a`.`employee_address` AS `employee_address`,`a`.`employee_phone` AS `employee_phone`,`a`.`employee_name` AS `employee_name`,`a`.`employee_born_place` AS `employee_born_place`,`a`.`employee_born_date` AS `employee_born_date`,`b`.`rfid` AS `rfid`,`b`.`pin` AS `pin`,117 AS `pekerjaan`,'Anggota' AS `departemen`,`b`.`status` AS `rfid_status` from (`masterep-annursulsel`.`employee` `a` left join `masterep-annursulsel`.`employee_cards` `b` on((`a`.`employee_nip` = `b`.`nip`))) where (`a`.`employee_status` = 1);

-- changeset liquibase:1794384377701-260 splitStatements:false
CREATE VIEW ipaymu_bulan_v AS select `a`.`bulan_id` AS `bulan_id`,`a`.`bulan_noref` AS `bulan_noref`,`a`.`bulan_account_id` AS `bulan_account_id`,`a`.`student_student_id` AS `student_student_id`,`a`.`payment_payment_id` AS `payment_payment_id`,`a`.`month_month_id` AS `month_month_id`,`a`.`bulan_bill` AS `bulan_bill`,`a`.`bulan_status` AS `bulan_status`,`a`.`bulan_number_pay` AS `bulan_number_pay`,`a`.`bulan_date_pay` AS `bulan_date_pay`,`a`.`user_user_id` AS `user_user_id`,`a`.`sekolah_id` AS `sekolah_id`,`a`.`bulan_input_date` AS `bulan_input_date`,`a`.`bulan_last_update` AS `bulan_last_update`,`a`.`ipaymu_no_trans` AS `ipaymu_no_trans`,`a`.`ipaymu_status` AS `ipaymu_status` from `masterep-annursulsel`.`bulan` `a` where (ifnull(`a`.`ipaymu_no_trans`,0) > 0) order by `a`.`ipaymu_no_trans`;

-- changeset liquibase:1794384377701-261 splitStatements:false
CREATE VIEW log_transfer_v AS select `masterep-annursulsel`.`log_tf`.`log_tf_id` AS `log_tf_id`,`masterep-annursulsel`.`log_tf`.`log_tf_date` AS `log_tf_date`,`masterep-annursulsel`.`log_tf`.`log_tf_kredit_id` AS `log_tf_kredit_id`,`masterep-annursulsel`.`log_tf`.`log_tf_debit_id` AS `log_tf_debit_id`,`masterep-annursulsel`.`log_tf`.`log_tf_note` AS `log_tf_note`,`masterep-annursulsel`.`log_tf`.`log_tf_balance_id` AS `log_tf_balance_id`,`masterep-annursulsel`.`majors`.`majors_id` AS `majors_id`,`masterep-annursulsel`.`majors`.`majors_short_name` AS `majors_short_name`,`masterep-annursulsel`.`kredit`.`kredit_kas_noref` AS `kredit_kas_noref`,`masterep-annursulsel`.`kredit`.`kredit_kas_account_id` AS `kredit_kas_account_id`,`masterep-annursulsel`.`kredit`.`kredit_value` AS `kredit_value`,`masterep-annursulsel`.`debit`.`debit_kas_noref` AS `debit_kas_noref`,`masterep-annursulsel`.`debit`.`debit_kas_account_id` AS `debit_kas_account_id`,`masterep-annursulsel`.`debit`.`debit_value` AS `debit_value`,`masterep-annursulsel`.`debit`.`debit_date` AS `debit_date`,`masterep-annursulsel`.`users`.`user_id` AS `user_id`,`masterep-annursulsel`.`users`.`user_full_name` AS `user_full_name`,`masterep-annursulsel`.`account`.`account_description` AS `account_description`,`masterep-annursulsel`.`majors`.`majors_status` AS `majors_status` from (((((`masterep-annursulsel`.`log_tf` left join `masterep-annursulsel`.`kredit` on((`masterep-annursulsel`.`kredit`.`kredit_id` = `masterep-annursulsel`.`log_tf`.`log_tf_kredit_id`))) left join `masterep-annursulsel`.`debit` on((`masterep-annursulsel`.`debit`.`debit_id` = `masterep-annursulsel`.`log_tf`.`log_tf_debit_id`))) left join `masterep-annursulsel`.`majors` on((`masterep-annursulsel`.`majors`.`majors_id` = `masterep-annursulsel`.`log_tf`.`log_tf_majors_id`))) left join `masterep-annursulsel`.`account` on((`masterep-annursulsel`.`account`.`account_id` = `masterep-annursulsel`.`log_tf`.`log_tf_account_id`))) left join `masterep-annursulsel`.`users` on((`masterep-annursulsel`.`users`.`user_id` = `masterep-annursulsel`.`log_tf`.`log_tf_user_id`)));

-- changeset liquibase:1794384377701-262 splitStatements:false
CREATE VIEW siswa_kelas_v AS select `a`.`student_id` AS `student_id`,concat('872900022008',lpad(`a`.`student_id`,4,'0')) AS `vano`,`a`.`student_full_name` AS `nama`,`a`.`student_nis` AS `student_nis`,10000 AS `nominal` from `masterep-annursulsel`.`student` `a`;

-- changeset liquibase:1794384377701-263 splitStatements:false
CREATE VIEW v_laba_rugi AS select `a`.`id` AS `id`,`b`.`tanggal` AS `tanggal`,`c`.`account_code` AS `kd_aktiva`,`c`.`account_description` AS `jns_trans`,sum(`a`.`debet`) AS `debet`,sum(`a`.`kredit`) AS `kredit`,`b`.`sekolah_id` AS `majors_id` from (((`masterep-annursulsel`.`jurnal_umum_detail` `a` join `masterep-annursulsel`.`jurnal_umum` `b` on((`a`.`id_jurnal` = `b`.`id`))) join `masterep-annursulsel`.`kas` `k` on((`k`.`kas_noref` = `b`.`noref`))) join `masterep-annursulsel`.`account` `c` on((`c`.`account_code` = `a`.`account_code`))) where ((`c`.`account_code` like '4%') or (`c`.`account_code` like '5%')) group by `b`.`tanggal`,`c`.`account_code`;

-- changeset liquibase:1794384377701-264 splitStatements:false
CREATE VIEW v_limit_tabungan_siswa AS select `masterep-annursulsel`.`student`.`student_id` AS `student_id`,`masterep-annursulsel`.`student`.`student_full_name` AS `student_full_name`,`masterep-annursulsel`.`student`.`student_nis` AS `student_nis`,`masterep-annursulsel`.`class`.`class_name` AS `class_name`,`masterep-annursulsel`.`majors`.`majors_short_name` AS `majors_short_name`,coalesce(`masterep-annursulsel`.`banking_limit`.`limit`,0) AS `withdraw_limit` from (((`masterep-annursulsel`.`student` join `masterep-annursulsel`.`majors` on((`masterep-annursulsel`.`majors`.`majors_id` = `masterep-annursulsel`.`student`.`majors_majors_id`))) join `masterep-annursulsel`.`class` on((`masterep-annursulsel`.`class`.`class_id` = `masterep-annursulsel`.`student`.`class_class_id`))) left join `masterep-annursulsel`.`banking_limit` on((`masterep-annursulsel`.`banking_limit`.`nis` = `masterep-annursulsel`.`student`.`student_nis`)));

-- changeset liquibase:1794384377701-265 splitStatements:false
CREATE VIEW v_transaksi_tertunda AS select `ad`.`account_majors_id` AS `idMajors`,`bl`.`bulan_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bl`.`bulan_date_pay` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`py`.`period_period_id` AS `idPeriod`,`m`.`month_name` AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`,' - ',`m`.`month_name`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bl`.`bulan_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bulan' AS `jenisTransaksi` from ((((((((((`masterep-annursulsel`.`bulan` `bl` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bl`.`bulan_account_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `bl`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`month` `m` on((`m`.`month_id` = `bl`.`month_month_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `bl`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) left join `masterep-annursulsel`.`kas` `ks` on((`ks`.`kas_noref` = `bl`.`bulan_noref`))) left join `masterep-annursulsel`.`jurnal_umum` `ju` on((`ju`.`noref` = `bl`.`bulan_noref`))) where ((`bl`.`bulan_status` = 1) and (`bl`.`bulan_bill` > 0) and (`ks`.`kas_noref` is null) and (`ju`.`noref` is null)) union all select `ad`.`account_majors_id` AS `idMajors`,`bp`.`bebas_pay_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bp`.`bebas_pay_input_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`py`.`period_period_id` AS `idPeriod`,'' AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bp`.`bebas_pay_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bebas' AS `jenisTransaksi` from ((((((((((`masterep-annursulsel`.`bebas_pay` `bp` join `masterep-annursulsel`.`bebas` `b` on((`b`.`bebas_id` = `bp`.`bebas_bebas_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `b`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `b`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bp`.`bebas_pay_account_id`))) left join `masterep-annursulsel`.`kas` `ks` on((`ks`.`kas_noref` = `bp`.`bebas_pay_noref`))) left join `masterep-annursulsel`.`jurnal_umum` `ju` on((`ju`.`noref` = `bp`.`bebas_pay_noref`))) where ((`bp`.`bebas_pay_noref` is not null) and (`ks`.`kas_noref` is null) and (`ju`.`noref` is null));

-- changeset liquibase:1794384377701-293 splitStatements:false
DROP TABLE sekolah;

-- changeset liquibase:1794384377701-294 splitStatements:false
ALTER TABLE gaji DROP COLUMN gaji_sekunder;

-- changeset liquibase:1794384377701-295 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_bpjstk;

-- changeset liquibase:1794384377701-296 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_koperasi;

-- changeset liquibase:1794384377701-297 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_lain;

-- changeset liquibase:1794384377701-298 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_simpanan;

-- changeset liquibase:1794384377701-299 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_sumbangan;

-- changeset liquibase:1794384377701-300 splitStatements:false
ALTER TABLE premier DROP COLUMN premier_kinerja;

-- changeset liquibase:1794384377701-301 splitStatements:false
ALTER TABLE premier DROP COLUMN premier_lain;

-- changeset liquibase:1794384377701-302 splitStatements:false
ALTER TABLE premier DROP COLUMN premier_makan;

-- changeset liquibase:1794384377701-303 splitStatements:false
ALTER TABLE subsatu DROP COLUMN subsatu_kinerja;

-- changeset liquibase:1794384377701-304 splitStatements:false
ALTER TABLE subsatu DROP COLUMN subsatu_lain;

-- changeset liquibase:1794384377701-305 splitStatements:false
ALTER TABLE subsatu DROP COLUMN subsatu_makan;

-- changeset liquibase:1794384377701-306 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_bpjstk;

-- changeset liquibase:1794384377701-307 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_koperasi;

-- changeset liquibase:1794384377701-308 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_lain;

-- changeset liquibase:1794384377701-309 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_simpanan;

-- changeset liquibase:1794384377701-310 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_sumbangan;

-- changeset liquibase:1794384377701-1 splitStatements:false
ALTER TABLE employee MODIFY area_absen VARCHAR(50);

-- changeset liquibase:1794384377701-2 splitStatements:false
ALTER TABLE employee ALTER area_absen SET DEFAULT '1';

-- changeset liquibase:1794384377701-3 splitStatements:false
ALTER TABLE bebas_pay MODIFY bebas_pay_account_id INT NULL;

-- changeset liquibase:1794384377701-4 splitStatements:false
ALTER TABLE bebas_pay MODIFY bebas_pay_noref VARCHAR(50) NULL;

-- changeset liquibase:1794384377701-5 splitStatements:false
ALTER TABLE debit_temp MODIFY debit_temp_input_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- changeset liquibase:1794384377701-6 splitStatements:false
ALTER TABLE debit_temp MODIFY debit_temp_last_update timestamp(0) NULL;

-- changeset liquibase:1794384377701-7 splitStatements:false
ALTER TABLE debit_temp ALTER debit_temp_last_update DROP DEFAULT;

-- changeset liquibase:1794384377701-8 splitStatements:false
ALTER TABLE employee MODIFY employee_input_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- changeset liquibase:1794384377701-9 splitStatements:false
ALTER TABLE employee MODIFY employee_last_update timestamp(0) NULL;

-- changeset liquibase:1794384377701-10 splitStatements:false
ALTER TABLE employee ALTER employee_last_update DROP DEFAULT;

-- changeset liquibase:1794384377701-11 splitStatements:false
ALTER TABLE hutang MODIFY hutang_date date NOT NULL;

-- changeset liquibase:1794384377701-12 splitStatements:false
ALTER TABLE hutang ALTER hutang_date SET DEFAULT (curdate());

-- changeset liquibase:1794384377701-13 splitStatements:false
ALTER TABLE hutang_pay MODIFY hutang_pay_date date NOT NULL;

-- changeset liquibase:1794384377701-14 splitStatements:false
ALTER TABLE hutang_pay ALTER hutang_pay_date SET DEFAULT (curdate());

-- changeset liquibase:1794384377701-15 splitStatements:false
ALTER TABLE pesan MODIFY id_funding LONGTEXT;

-- changeset liquibase:1794384377701-16 splitStatements:false
ALTER TABLE kredit_temp MODIFY kredit_temp_last_update timestamp(0) NULL;

-- changeset liquibase:1794384377701-17 splitStatements:false
ALTER TABLE kredit_temp ALTER kredit_temp_last_update DROP DEFAULT;

-- changeset liquibase:1794384377701-18 splitStatements:false
ALTER TABLE payment MODIFY payment_is_batch ENUM('0', '1') NULL;

-- changeset liquibase:1794384377701-19 splitStatements:false
ALTER TABLE premier ALTER premier_transport SET DEFAULT 0;

-- changeset liquibase:1794384377701-20 splitStatements:false
ALTER TABLE presensi_pelajaran MODIFY presensi_pelajaran_semester_id INT NOT NULL;

-- changeset liquibase:1794384377701-21 splitStatements:false
ALTER TABLE semester MODIFY semester_name VARCHAR(100);

-- changeset liquibase:1794384377701-22 splitStatements:false
ALTER TABLE settinghutang MODIFY settinghutang_period_id INT NOT NULL;

-- changeset liquibase:1794384377701-23 splitStatements:false
ALTER TABLE student MODIFY student_madin VARCHAR(50) NOT NULL;

-- changeset liquibase:1794384377701-24 splitStatements:false
ALTER TABLE student MODIFY student_password LONGTEXT;

-- changeset liquibase:1794384377701-25 splitStatements:false
ALTER TABLE subsatu ALTER subsatu_transport SET DEFAULT 0;

-- changeset liquibase:1794384377701-26 splitStatements:false
ALTER TABLE teaching MODIFY teaching_schedule_id INT NOT NULL;

-- changeset liquibase:1794384377701-27 splitStatements:false
ALTER TABLE student_token MODIFY token_student VARCHAR(255);

-- changeset liquibase:1794384377701-28 splitStatements:false
ALTER TABLE settinghutang DROP KEY settinghutang_period_id;

-- changeset liquibase:1794384377701-29 splitStatements:false
ALTER TABLE settinghutang ADD CONSTRAINT settinghutang_period_id UNIQUE (settinghutang_period_id);

-- changeset liquibase:1794384377701-30 splitStatements:false
CREATE OR REPLACE VIEW presensi_area_v AS select `a`.`employee_id` AS `id_pegawai`,`a`.`employee_nip` AS `nip`,`a`.`employee_name` AS `nama_pegawai`,`a`.`employee_majors_id` AS `id_unit`,`a`.`employee_position_id` AS `id_jabatan`,`a`.`status_absen` AS `status_absen`,`a`.`status_absen_temp` AS `status_absen_temp`,`a`.`area_absen` AS `area_absen`,`a`.`jarak_radius` AS `jarak_radius` from `masterep-annursulsel`.`employee` `a`;

-- changeset liquibase:1794384377701-31 splitStatements:false
SELECT 1;

-- changeset liquibase:1794384377701-32 splitStatements:false
CREATE OR REPLACE VIEW v_laporan_jurnal AS select `ad`.`account_majors_id` AS `idMajors`,`bl`.`bulan_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bl`.`bulan_date_pay` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`m`.`month_name` AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`,' - ',`m`.`month_name`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bl`.`bulan_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bulan' AS `jenisTransaksi` from ((((((((`masterep-annursulsel`.`bulan` `bl` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bl`.`bulan_account_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `bl`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`month` `m` on((`m`.`month_id` = `bl`.`month_month_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `bl`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) where ((`bl`.`bulan_status` = 1) and (`bl`.`bulan_bill` > 0)) union all select `ad`.`account_majors_id` AS `idMajors`,`bp`.`bebas_pay_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bp`.`bebas_pay_input_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,'' AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bp`.`bebas_pay_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bebas' AS `jenisTransaksi` from ((((((((`masterep-annursulsel`.`bebas_pay` `bp` join `masterep-annursulsel`.`bebas` `b` on((`b`.`bebas_id` = `bp`.`bebas_bebas_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `b`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `b`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bp`.`bebas_pay_account_id`))) where (`bp`.`bebas_pay_noref` is not null) union all select `ad`.`account_majors_id` AS `idMajors`,`d`.`debit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`d`.`debit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`d`.`debit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,`d`.`debit_value` AS `penerimaan`,0 AS `pengeluaran`,'Debit' AS `jenisTransaksi` from ((`masterep-annursulsel`.`debit` `d` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `d`.`debit_kas_account_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `d`.`debit_account_id`))) union all select `ad`.`account_majors_id` AS `idMajors`,`k`.`kredit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`k`.`kredit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`k`.`kredit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,0 AS `penerimaan`,`k`.`kredit_value` AS `pengeluaran`,'Kredit' AS `jenisTransaksi` from ((`masterep-annursulsel`.`kredit` `k` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `k`.`kredit_kas_account_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `k`.`kredit_account_id`)));

-- changeset liquibase:1794384377701-33 splitStatements:false
CREATE OR REPLACE VIEW v_laporan_jurnal_old AS select `py`.`period_period_id` AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`bl`.`bulan_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bl`.`bulan_date_pay` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`m`.`month_name` AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`,' - ',`m`.`month_name`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bl`.`bulan_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bulan' AS `jenisTransaksi` from ((((((((`masterep-annursulsel`.`bulan` `bl` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bl`.`bulan_account_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `bl`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`month` `m` on((`m`.`month_id` = `bl`.`month_month_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `bl`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) where ((`bl`.`bulan_status` = 1) and (`bl`.`bulan_bill` > 0)) union all select `py`.`period_period_id` AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`bp`.`bebas_pay_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bp`.`bebas_pay_input_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,'' AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bp`.`bebas_pay_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bebas' AS `jenisTransaksi` from ((((((((`masterep-annursulsel`.`bebas_pay` `bp` join `masterep-annursulsel`.`bebas` `b` on((`b`.`bebas_id` = `bp`.`bebas_bebas_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `b`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `b`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bp`.`bebas_pay_account_id`))) where (`bp`.`bebas_pay_noref` is not null) union all select 0 AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`d`.`debit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`d`.`debit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`d`.`debit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,`d`.`debit_value` AS `penerimaan`,0 AS `pengeluaran`,'Debit' AS `jenisTransaksi` from ((`masterep-annursulsel`.`debit` `d` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `d`.`debit_kas_account_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `d`.`debit_account_id`))) union all select 0 AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`k`.`kredit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`k`.`kredit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`k`.`kredit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,0 AS `penerimaan`,`k`.`kredit_value` AS `pengeluaran`,'Kredit' AS `jenisTransaksi` from ((`masterep-annursulsel`.`kredit` `k` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `k`.`kredit_kas_account_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `k`.`kredit_account_id`)));

