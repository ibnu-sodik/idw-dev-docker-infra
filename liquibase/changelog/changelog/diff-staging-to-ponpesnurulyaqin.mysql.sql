-- liquibase formatted sql

-- changeset liquibase:1794584573894-258 splitStatements:false
ALTER TABLE data_absensi DROP FOREIGN KEY FK_bmt_data_absensi_area_absensi;

-- changeset liquibase:1794584573894-259 splitStatements:false
ALTER TABLE data_absensi DROP FOREIGN KEY FK_bmt_data_absensi_employee;

-- changeset liquibase:1794584573894-260 splitStatements:false
ALTER TABLE bebas_pay DROP FOREIGN KEY fk_bebas_pay_bebas1;

-- changeset liquibase:1794584573894-261 splitStatements:false
ALTER TABLE bebas DROP FOREIGN KEY fk_bebas_payment1;

-- changeset liquibase:1794584573894-262 splitStatements:false
ALTER TABLE bebas DROP FOREIGN KEY fk_bebas_student1;

-- changeset liquibase:1794584573894-263 splitStatements:false
ALTER TABLE bulan DROP FOREIGN KEY fk_bulan_month1;

-- changeset liquibase:1794584573894-264 splitStatements:false
ALTER TABLE bulan DROP FOREIGN KEY fk_bulan_payment1;

-- changeset liquibase:1794584573894-265 splitStatements:false
ALTER TABLE bulan DROP FOREIGN KEY fk_bulan_student1;

-- changeset liquibase:1794584573894-266 splitStatements:false
ALTER TABLE bulan DROP FOREIGN KEY fk_bulan_users1;

-- changeset liquibase:1794584573894-267 splitStatements:false
ALTER TABLE logs DROP FOREIGN KEY fk_g_activity_log_g_user1;

-- changeset liquibase:1794584573894-268 splitStatements:false
ALTER TABLE hutang_pay DROP FOREIGN KEY fk_hutang_pay_hutang1;

-- changeset liquibase:1794584573894-269 splitStatements:false
ALTER TABLE hutang_pay DROP FOREIGN KEY fk_hutang_pay_users1;

-- changeset liquibase:1794584573894-270 splitStatements:false
ALTER TABLE hutang DROP FOREIGN KEY fk_hutang_settinghutang1;

-- changeset liquibase:1794584573894-271 splitStatements:false
ALTER TABLE information DROP FOREIGN KEY fk_information_users1;

-- changeset liquibase:1794584573894-272 splitStatements:false
ALTER TABLE debit DROP FOREIGN KEY fk_jurnal_debit_users1;

-- changeset liquibase:1794584573894-273 splitStatements:false
ALTER TABLE kredit DROP FOREIGN KEY fk_jurnal_kredit_users1;

-- changeset liquibase:1794584573894-274 splitStatements:false
ALTER TABLE log_hutang DROP FOREIGN KEY fk_log_hutang_hutang1;

-- changeset liquibase:1794584573894-275 splitStatements:false
ALTER TABLE log_hutang DROP FOREIGN KEY fk_log_hutang_hutang_pay1;

-- changeset liquibase:1794584573894-276 splitStatements:false
ALTER TABLE log_trx DROP FOREIGN KEY fk_log_trx_bebas_pay1;

-- changeset liquibase:1794584573894-277 splitStatements:false
ALTER TABLE log_trx DROP FOREIGN KEY fk_log_trx_bulan1;

-- changeset liquibase:1794584573894-278 splitStatements:false
ALTER TABLE log_trx DROP FOREIGN KEY fk_log_trx_student1;

-- changeset liquibase:1794584573894-279 splitStatements:false
ALTER TABLE payment DROP FOREIGN KEY fk_payment_period1;

-- changeset liquibase:1794584573894-280 splitStatements:false
ALTER TABLE payment DROP FOREIGN KEY fk_payment_pos1;

-- changeset liquibase:1794584573894-281 splitStatements:false
ALTER TABLE settinghutang DROP FOREIGN KEY fk_settinghutang_period1;

-- changeset liquibase:1794584573894-282 splitStatements:false
ALTER TABLE settinghutang DROP FOREIGN KEY fk_settinghutang_pos1;

-- changeset liquibase:1794584573894-283 splitStatements:false
ALTER TABLE student DROP FOREIGN KEY fk_student_class1;

-- changeset liquibase:1794584573894-284 splitStatements:false
ALTER TABLE student DROP FOREIGN KEY fk_student_majors1;

-- changeset liquibase:1794584573894-285 splitStatements:false
ALTER TABLE users DROP FOREIGN KEY fk_user_user_role1;

-- changeset liquibase:1794584573894-286 splitStatements:false
ALTER TABLE jurnal_umum_detail DROP FOREIGN KEY jurnal_umum_detail_ibfk_1;

-- changeset liquibase:1794584573894-44 splitStatements:false
CREATE TABLE accessed_menus (id INT AUTO_INCREMENT NOT NULL, student_id VARCHAR(255) NULL, school_code VARCHAR(255) NULL, school_name VARCHAR(255) NULL, menu_name VARCHAR(255) NULL, accessed_at datetime(0) NULL, CONSTRAINT PK_ACCESSED_MENUS PRIMARY KEY (id));

-- changeset liquibase:1794584573894-45 splitStatements:false
CREATE TABLE account_depok (account_id INT AUTO_INCREMENT NOT NULL, account_code VARCHAR(20) NOT NULL, account_description TEXT NOT NULL, account_note INT NOT NULL, account_category INT NOT NULL, account_type INT NOT NULL, account_status INT DEFAULT 1 NOT NULL, account_majors_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_ACCOUNT_DEPOK PRIMARY KEY (account_id));

-- changeset liquibase:1794584573894-46 splitStatements:false
CREATE TABLE aktivitas (aktivitas_id INT AUTO_INCREMENT NOT NULL, aktivitas_standar_id INT NULL, aktivitas_kode VARCHAR(20) NOT NULL, aktivitas_account_id INT NOT NULL, aktivitas_name TEXT NOT NULL, urutan INT DEFAULT 0 NOT NULL, CONSTRAINT PK_AKTIVITAS PRIMARY KEY (aktivitas_id));

-- changeset liquibase:1794584573894-47 splitStatements:false
CREATE TABLE alumni (alumni_id INT AUTO_INCREMENT NOT NULL, alumni_nis VARCHAR(45) NULL, alumni_nisn VARCHAR(45) NULL, alumni_full_name VARCHAR(255) NULL, alumni_gender ENUM('L', 'P') NULL, alumni_born_place VARCHAR(45) NULL, alumni_born_date date NULL, alumni_password TEXT NULL, alumni_img VARCHAR(255) NULL, alumni_phone VARCHAR(45) NULL, alumni_hobby VARCHAR(100) NULL, alumni_address TEXT NULL, alumni_name_of_mother VARCHAR(255) NULL, alumni_name_of_father VARCHAR(255) NULL, alumni_parent_phone VARCHAR(45) NULL, alumni_unit INT NULL, alumni_kelas INT NULL, alumni_madin VARCHAR(100) NULL, alumni_tahun_id INT NULL, alumni_input_date timestamp(0) DEFAULT NOW() NULL, alumni_last_update timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_ALUMNI PRIMARY KEY (alumni_id));

-- changeset liquibase:1794584573894-48 splitStatements:false
CREATE TABLE anggaran (anggaran_id INT AUTO_INCREMENT NOT NULL, anggaran_period_id INT NULL, anggaran_account_id INT NULL, anggaran_input_date timestamp(0) NULL, anggaran_last_update timestamp(0) NULL, CONSTRAINT PK_ANGGARAN PRIMARY KEY (anggaran_id));

-- changeset liquibase:1794584573894-49 splitStatements:false
CREATE TABLE anggaran_detail (anggaran_detail_id INT AUTO_INCREMENT NOT NULL, anggaran_detail_anggaran_id INT NOT NULL, anggaran_detail_month_id INT NOT NULL, anggaran_detail_nominal INT NOT NULL, CONSTRAINT PK_ANGGARAN_DETAIL PRIMARY KEY (anggaran_detail_id));

-- changeset liquibase:1794584573894-50 splitStatements:false
CREATE TABLE ars_jenis (id_jenis INT AUTO_INCREMENT NOT NULL, jenis_arsip VARCHAR(50) NOT NULL, majors_id VARCHAR(50) NOT NULL, create_date date NOT NULL, CONSTRAINT PK_ARS_JENIS PRIMARY KEY (id_jenis));

-- changeset liquibase:1794584573894-51 splitStatements:false
CREATE TABLE ars_lokasi (id_lokasi INT AUTO_INCREMENT NOT NULL, nama_lokasi VARCHAR(80) NOT NULL, tanggal date NOT NULL, CONSTRAINT PK_ARS_LOKASI PRIMARY KEY (id_lokasi), UNIQUE (nama_lokasi));

-- changeset liquibase:1794584573894-52 splitStatements:false
CREATE TABLE ars_pengajuan (id_pengajuan INT AUTO_INCREMENT NOT NULL, id_pejabat VARCHAR(60) NOT NULL, id_satuan VARCHAR(50) NOT NULL, nama_arsip VARCHAR(60) NOT NULL, jumlah VARCHAR(50) NOT NULL, satuan VARCHAR(50) NOT NULL, tanggal date NOT NULL, tujuan TEXT NOT NULL, file_arsip VARCHAR(50) NULL, id_jenis VARCHAR(50) NOT NULL, nonaktif ENUM('n', 'y') NOT NULL, CONSTRAINT PK_ARS_PENGAJUAN PRIMARY KEY (id_pengajuan));

-- changeset liquibase:1794584573894-53 splitStatements:false
CREATE TABLE ars_satuan (id_satuan INT AUTO_INCREMENT NOT NULL, nama_satuan VARCHAR(30) NOT NULL, keterangan VARCHAR(100) NOT NULL, CONSTRAINT PK_ARS_SATUAN PRIMARY KEY (id_satuan), UNIQUE (nama_satuan));

-- changeset liquibase:1794584573894-54 splitStatements:false
CREATE TABLE arsip (id_arsip INT AUTO_INCREMENT NOT NULL, id_jenis VARCHAR(15) NOT NULL, id_users INT NOT NULL, nama_arsip VARCHAR(50) NOT NULL, file_arsip VARCHAR(50) NOT NULL, jumlah VARCHAR(20) NOT NULL, id_satuan VARCHAR(20) NOT NULL, lokasi VARCHAR(50) NOT NULL, ket_isi TEXT NOT NULL, status INT NOT NULL, tanggal date NOT NULL, permision VARCHAR(30) NOT NULL, CONSTRAINT PK_ARSIP PRIMARY KEY (id_arsip));

-- changeset liquibase:1794584573894-55 splitStatements:false
CREATE TABLE banking_limit (id INT AUTO_INCREMENT NOT NULL, nis VARCHAR(100) NOT NULL, `limit` INT DEFAULT 0 NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_BANKING_LIMIT PRIMARY KEY (id));

-- changeset liquibase:1794584573894-56 splitStatements:false
CREATE TABLE banks (id INT UNSIGNED AUTO_INCREMENT NOT NULL, code VARCHAR(255) NULL, name VARCHAR(50) NULL, logo VARCHAR(255) NULL, fee INT NOT NULL, cara_bayar TEXT NULL, cara_bayar_new JSON NULL, status INT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_BANKS PRIMARY KEY (id));

-- changeset liquibase:1794584573894-57 splitStatements:false
CREATE TABLE barang (barang_id INT AUTO_INCREMENT NOT NULL, barang_no VARCHAR(50) NOT NULL, barang_name VARCHAR(225) NOT NULL, barang_stok INT NOT NULL, satuan_id INT NULL, keterangan TEXT NOT NULL, gambar VARCHAR(255) NOT NULL, user_id INT NOT NULL, input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG PRIMARY KEY (barang_id));

-- changeset liquibase:1794584573894-58 splitStatements:false
CREATE TABLE barang_guru (barang_guru_id INT AUTO_INCREMENT NOT NULL, barang_guru_no VARCHAR(50) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG_GURU PRIMARY KEY (barang_guru_id), UNIQUE (barang_guru_no));

-- changeset liquibase:1794584573894-59 splitStatements:false
CREATE TABLE barang_permintaan_guru (permintaan_id INT AUTO_INCREMENT NOT NULL, barang_id INT NOT NULL, jumlah INT NOT NULL, barang_guru_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG_PERMINTAAN_GURU PRIMARY KEY (permintaan_id));

-- changeset liquibase:1794584573894-60 splitStatements:false
CREATE TABLE barang_permintaan_siswa (permintaan_id INT AUTO_INCREMENT NOT NULL, barang_id INT NOT NULL, jumlah INT NOT NULL, barang_siswa_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG_PERMINTAAN_SISWA PRIMARY KEY (permintaan_id));

-- changeset liquibase:1794584573894-61 splitStatements:false
CREATE TABLE barang_siswa (barang_siswa_id INT AUTO_INCREMENT NOT NULL, barang_siswa_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, catatan TEXT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BARANG_SISWA PRIMARY KEY (barang_siswa_id), UNIQUE (barang_siswa_no));

-- changeset liquibase:1794584573894-62 splitStatements:false
CREATE TABLE bmi_inquiry (id INT AUTO_INCREMENT NOT NULL, CCY VARCHAR(50) NULL, VANO VARCHAR(50) NULL, TRXDATE VARCHAR(50) NULL, USERNAME VARCHAR(100) NULL, PASSWORD VARCHAR(100) NULL, CHANNELID VARCHAR(50) NULL, REFNO VARCHAR(50) NULL, BILL VARCHAR(50) NULL, DESCRIPTION TEXT NULL, DESCRIPTION2 TEXT NULL, ERR VARCHAR(50) NULL, METHOD VARCHAR(50) NULL, CUSTNAME VARCHAR(50) NULL, remark VARCHAR(100) NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_BMI_INQUIRY PRIMARY KEY (id));

-- changeset liquibase:1794584573894-63 splitStatements:false
CREATE TABLE bmi_log (id INT AUTO_INCREMENT NOT NULL, txt TEXT NULL, created_date VARCHAR(100) NULL, CONSTRAINT PK_BMI_LOG PRIMARY KEY (id));

-- changeset liquibase:1794584573894-64 splitStatements:false
CREATE TABLE bmi_payment (ID INT AUTO_INCREMENT NOT NULL, TRXDATE VARCHAR(100) NULL, CCY VARCHAR(100) NULL, REFNO VARCHAR(100) NULL, BILL VARCHAR(100) NULL, PAYMENT VARCHAR(100) NULL, CHANNELID VARCHAR(100) NULL, METHOD VARCHAR(100) NULL, VANO VARCHAR(100) NULL, CUSTNAME VARCHAR(100) NULL, USERNAME VARCHAR(100) NULL, PASSWORD VARCHAR(100) NULL, DESCRIPTION2 VARCHAR(100) NULL, DESCRIPTION VARCHAR(100) NULL, ERR VARCHAR(100) NULL, IP_SOURCE VARCHAR(100) NULL, remark VARCHAR(100) NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_BMI_PAYMENT PRIMARY KEY (ID));

-- changeset liquibase:1794584573894-65 splitStatements:false
CREATE TABLE bmi_refersal (ID INT AUTO_INCREMENT NOT NULL, CCY VARCHAR(100) NULL, CUSTNAME VARCHAR(100) NULL, TRXDATE VARCHAR(100) NULL, REFNO VARCHAR(100) NULL, BILL VARCHAR(100) NULL, CHANNELID VARCHAR(100) NULL, METHOD VARCHAR(100) NULL, PYMTDATE VARCHAR(100) NULL, PAYMENT VARCHAR(100) NULL, VANO VARCHAR(100) NULL, USERNAME VARCHAR(100) NULL, PASSWORD VARCHAR(100) NULL, ERR VARCHAR(100) NULL, remark VARCHAR(100) NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_BMI_REFERSAL PRIMARY KEY (ID));

-- changeset liquibase:1794584573894-66 splitStatements:false
CREATE TABLE bmi_transaksi (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal datetime(0) NOT NULL, student_id INT NOT NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, va_transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_BMI_TRANSAKSI PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794584573894-67 splitStatements:false
CREATE TABLE budget_detail (budget_detail_id INT AUTO_INCREMENT NOT NULL, budget_detail_budgeting_id INT NOT NULL, budget_detail_bulan_id INT NOT NULL, budget_detail_satuan_id INT NOT NULL, budget_detail_nominal INT NOT NULL, budget_detail_jumlah INT NOT NULL, budget_created_at timestamp(0) DEFAULT NOW() NOT NULL, budget_updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BUDGET_DETAIL PRIMARY KEY (budget_detail_id));

-- changeset liquibase:1794584573894-68 splitStatements:false
CREATE TABLE budgeting (budgeting_id INT AUTO_INCREMENT NOT NULL, budgeting_worksheet_id INT NOT NULL, budgeting_kegiatan_id INT NOT NULL, budgeting_aktivitas_id INT NOT NULL, budgeting_uraian TEXT NOT NULL, budgeting_created_at timestamp(0) DEFAULT NOW() NOT NULL, budgeting_updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_BUDGETING PRIMARY KEY (budgeting_id));

-- changeset liquibase:1794584573894-69 splitStatements:false
CREATE TABLE callback_booking (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_CALLBACK_BOOKING PRIMARY KEY (id));

-- changeset liquibase:1794584573894-70 splitStatements:false
CREATE TABLE callback_donasi (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_CALLBACK_DONASI PRIMARY KEY (id));

-- changeset liquibase:1794584573894-71 splitStatements:false
CREATE TABLE cards (id INT AUTO_INCREMENT NOT NULL, nis VARCHAR(100) NOT NULL, rfid VARCHAR(100) NULL, pin VARCHAR(100) NOT NULL, status ENUM('Y', 'N') NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_CARDS PRIMARY KEY (id));

-- changeset liquibase:1794584573894-72 splitStatements:false
CREATE TABLE category (category_id INT AUTO_INCREMENT NOT NULL, category_name VARCHAR(50) NULL, CONSTRAINT PK_CATEGORY PRIMARY KEY (category_id));

-- changeset liquibase:1794584573894-73 splitStatements:false
CREATE TABLE city (city_id CHAR(4) NOT NULL, city_province_id CHAR(2) NOT NULL, city_name TINYTEXT NOT NULL, CONSTRAINT PK_CITY PRIMARY KEY (city_id));

-- changeset liquibase:1794584573894-74 splitStatements:false
CREATE TABLE data_absensi_pengasuh (id INT AUTO_INCREMENT NOT NULL, id_pegawai INT NOT NULL, jenis_absen VARCHAR(100) NULL, statushadir VARCHAR(50) NULL, area_absen INT NOT NULL, bulan VARCHAR(100) NULL, tanggal date NULL, time VARCHAR(100) NULL, jam timestamp(0) DEFAULT NOW() NULL, longi VARCHAR(100) NULL, lati VARCHAR(100) NULL, lokasi VARCHAR(50) NULL, month VARCHAR(50) NULL, year VARCHAR(50) NULL, keterlambatan TEXT NULL, foto TEXT NULL, catatan_absen TEXT NULL, remark TEXT NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_DATA_ABSENSI_PENGASUH PRIMARY KEY (id));

-- changeset liquibase:1794584573894-75 splitStatements:false
CREATE TABLE data_ipaymu_callback_donasi (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_IPAYMU_CALLBACK_DONASI PRIMARY KEY (id));

-- changeset liquibase:1794584573894-76 splitStatements:false
CREATE TABLE data_ipaymu_callback_penginapan (id INT AUTO_INCREMENT NOT NULL, trx_id VARCHAR(100) NULL, sid VARCHAR(100) NULL, status VARCHAR(100) NULL, status_code VARCHAR(100) NULL, via VARCHAR(100) NULL, channel VARCHAR(100) NULL, va VARCHAR(100) NULL, reference_id VARCHAR(100) NULL, total VARCHAR(100) NULL, fees VARCHAR(100) NULL, comments VARCHAR(100) NULL, date VARCHAR(100) NULL, buyer_name VARCHAR(100) NULL, buyer_email VARCHAR(100) NULL, buyer_phone VARCHAR(100) NULL, is_escrow VARCHAR(100) NULL, created_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_DATA_IPAYMU_CALLBACK_PENGINAPAN PRIMARY KEY (id));

-- changeset liquibase:1794584573894-77 splitStatements:false
CREATE TABLE data_waktu_pengasuh (data_waktu_id INT AUTO_INCREMENT NOT NULL, data_waktu_name VARCHAR(50) NULL, data_waktu_majors_id INT NOT NULL, data_waktu_day_id INT NOT NULL, data_waktu_masuk time NOT NULL, data_waktu_pulang time NOT NULL, CONSTRAINT PK_DATA_WAKTU_PENGASUH PRIMARY KEY (data_waktu_id));

-- changeset liquibase:1794584573894-78 splitStatements:false
CREATE TABLE data_waktu_siswa (data_waktu_id INT AUTO_INCREMENT NOT NULL, data_waktu_majors_id INT NOT NULL, data_waktu_day_id INT NOT NULL, data_waktu_masuk time NOT NULL, data_waktu_pulang time NOT NULL, CONSTRAINT PK_DATA_WAKTU_SISWA PRIMARY KEY (data_waktu_id));

-- changeset liquibase:1794584573894-79 splitStatements:false
CREATE TABLE dokumen (dokumen_id INT AUTO_INCREMENT NOT NULL, dokumen_file VARCHAR(50) NOT NULL, dokumen_note TEXT NOT NULL, dokumen_employee_id INT NOT NULL, CONSTRAINT PK_DOKUMEN PRIMARY KEY (dokumen_id));

-- changeset liquibase:1794584573894-80 splitStatements:false
CREATE TABLE donasi (donasi_id INT AUTO_INCREMENT NOT NULL, program_program_id INT NOT NULL, donasi_nominal INT DEFAULT 10000 NOT NULL, donasi_note VARCHAR(100) NULL, donasi_status TINYINT(1) DEFAULT 0 NOT NULL, donasi_ref_id VARCHAR(10) NOT NULL, donasi_name VARCHAR(100) NOT NULL, as_anonim TINYINT(1) DEFAULT 0 NULL, donasi_hp VARCHAR(20) NOT NULL, donasi_alamat VARCHAR(100) NULL, donasi_email VARCHAR(100) NULL, donasi_datetime timestamp(0) DEFAULT NOW() NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT null on update CURRENT_TIMESTAMP NULL, CONSTRAINT PK_DONASI PRIMARY KEY (donasi_id));

-- changeset liquibase:1794584573894-81 splitStatements:false
CREATE TABLE ekskul (id INT AUTO_INCREMENT NOT NULL, ekskul_name VARCHAR(100) NOT NULL, ekskul_category INT NULL, ekskul_majors INT NULL, ekskul_mentor INT NOT NULL, CONSTRAINT PK_EKSKUL PRIMARY KEY (id));

-- changeset liquibase:1794584573894-82 splitStatements:false
CREATE TABLE ekskul_category (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT null on update CURRENT_TIMESTAMP NULL, CONSTRAINT PK_EKSKUL_CATEGORY PRIMARY KEY (id));

-- changeset liquibase:1794584573894-83 splitStatements:false
CREATE TABLE email_marketing (id INT UNSIGNED AUTO_INCREMENT NOT NULL, email VARCHAR(200) NOT NULL, follow_up_1 date NULL, status_1 ENUM('0', 'processing', '1') DEFAULT '0' NOT NULL, sent_1 datetime(0) NULL, follow_up_2 date NULL, status_2 ENUM('0', 'processing', '1') DEFAULT '0' NOT NULL, sent_2 datetime(0) NULL, follow_up_3 date NULL, status_3 ENUM('0', 'processing', '1') DEFAULT '0' NOT NULL, sent_3 datetime(0) NULL, created_at timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, updated_at timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, CONSTRAINT PK_EMAIL_MARKETING PRIMARY KEY (id));

-- changeset liquibase:1794584573894-84 splitStatements:false
CREATE TABLE email_marketing_log (id INT AUTO_INCREMENT NOT NULL, email_marketing_id INT NOT NULL, follow_up_number TINYINT(3) NOT NULL, email VARCHAR(255) NOT NULL, sent_at datetime(0) NOT NULL, status ENUM('success', 'fail') NOT NULL, message TEXT NULL, created_at datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_EMAIL_MARKETING_LOG PRIMARY KEY (id));

-- changeset liquibase:1794584573894-85 splitStatements:false
CREATE TABLE employee_cards (id INT AUTO_INCREMENT NOT NULL, nip VARCHAR(100) NOT NULL, rfid VARCHAR(100) NULL, pin VARCHAR(100) NOT NULL, status ENUM('Y', 'N') NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_EMPLOYEE_CARDS PRIMARY KEY (id));

-- changeset liquibase:1794584573894-86 splitStatements:false
CREATE TABLE gaji_default (default_gaji_id INT AUTO_INCREMENT NOT NULL, default_gaji_name VARCHAR(225) NULL, default_gaji_mode INT NULL, CONSTRAINT PK_GAJI_DEFAULT PRIMARY KEY (default_gaji_id));

-- changeset liquibase:1794584573894-87 splitStatements:false
CREATE TABLE gaji_setting (gaji_setting_id BIGINT AUTO_INCREMENT NOT NULL, gaji_setting_name VARCHAR(225) NOT NULL, gaji_setting_default_id INT NOT NULL, gaji_setting_nominal INT DEFAULT 0 NOT NULL, gaji_setting_employee_id INT NOT NULL, gaji_setting_date_input datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_GAJI_SETTING PRIMARY KEY (gaji_setting_id));

-- changeset liquibase:1794584573894-88 splitStatements:false
CREATE TABLE gaji_slip (gaji_slip_id BIGINT AUTO_INCREMENT NOT NULL, gaji_slip_name VARCHAR(225) NOT NULL, gaji_slip_setting_id INT NOT NULL, gaji_slip_nominal INT DEFAULT 0 NOT NULL, gaji_slip_gaji_id INT NOT NULL, gaji_slip_date_input datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_GAJI_SLIP PRIMARY KEY (gaji_slip_id));

-- changeset liquibase:1794584573894-89 splitStatements:false
CREATE TABLE gallery (gallery_id INT AUTO_INCREMENT NOT NULL, gallery_img TEXT NOT NULL, gallery_homestay_id INT NOT NULL, gallery_create_at timestamp(0) DEFAULT NOW() NOT NULL, gallery_update_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_GALLERY PRIMARY KEY (gallery_id));

-- changeset liquibase:1794584573894-90 splitStatements:false
CREATE TABLE homestay (homestay_id INT AUTO_INCREMENT NOT NULL, homestay_name VARCHAR(100) NOT NULL, homestay_price DOUBLE NOT NULL, homestay_desc TEXT NOT NULL, homestay_user_id INT NOT NULL, homestay_longitude TEXT NOT NULL, homestay_latitude TEXT NOT NULL, homestay_alamat VARCHAR(100) NULL, homestay_recomended ENUM('Y', 'N') NULL, homestay_create_at timestamp(0) DEFAULT NOW() NOT NULL, homestay_update_at timestamp(0) DEFAULT null on update CURRENT_TIMESTAMP NULL, CONSTRAINT PK_HOMESTAY PRIMARY KEY (homestay_id));

-- changeset liquibase:1794584573894-91 splitStatements:false
CREATE TABLE instansi (nama_instansi VARCHAR(100) NOT NULL, alamat_lengkap TEXT NOT NULL, telp VARCHAR(30) NOT NULL, informasi TEXT NOT NULL, keterangan_situs TEXT NOT NULL, fax VARCHAR(30) NOT NULL, npwp VARCHAR(40) NOT NULL, logo VARCHAR(50) NOT NULL, favicon VARCHAR(40) NOT NULL);

-- changeset liquibase:1794584573894-92 splitStatements:false
CREATE TABLE ipaymu_donasi (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal date NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, va_transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_IPAYMU_DONASI PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794584573894-93 splitStatements:false
CREATE TABLE ipaymu_penginapan (id_transaksi INT AUTO_INCREMENT NOT NULL, kode_pondok INT NOT NULL, noref VARCHAR(50) NULL, tanggal date NULL, nominal INT DEFAULT 0 NOT NULL, status VARCHAR(11) DEFAULT 'READY' NOT NULL, di_bayar INT DEFAULT 0 NOT NULL, va_no VARCHAR(50) NULL, va_nama VARCHAR(50) NULL, va_channel VARCHAR(50) NULL, va_bank VARCHAR(50) NULL, va_transactionId VARCHAR(50) NULL, Expired VARCHAR(50) NULL, va_fee VARCHAR(50) NULL, create_at timestamp(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_IPAYMU_PENGINAPAN PRIMARY KEY (id_transaksi));

-- changeset liquibase:1794584573894-94 splitStatements:false
CREATE TABLE jenis_keterangan (keterangan_id INT AUTO_INCREMENT NOT NULL, keterangan_nama VARCHAR(225) NOT NULL, keterangan_isi TEXT NOT NULL, keterangan_update timestamp(0) DEFAULT NOW() NOT NULL, keterangan_kop TEXT NOT NULL, CONSTRAINT PK_JENIS_KETERANGAN PRIMARY KEY (keterangan_id));

-- changeset liquibase:1794584573894-95 splitStatements:false
CREATE TABLE kategori_pelanggaran (id INT AUTO_INCREMENT NOT NULL, kategori TEXT NOT NULL, CONSTRAINT PK_KATEGORI_PELANGGARAN PRIMARY KEY (id));

-- changeset liquibase:1794584573894-96 splitStatements:false
CREATE TABLE kategori_prestasi (id INT AUTO_INCREMENT NOT NULL, kategori TEXT NOT NULL, CONSTRAINT PK_KATEGORI_PRESTASI PRIMARY KEY (id));

-- changeset liquibase:1794584573894-97 splitStatements:false
CREATE TABLE kegiatan (kegiatan_id INT AUTO_INCREMENT NOT NULL, kegiatan_name VARCHAR(45) NULL, kegiatan_majors_id INT NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_KEGIATAN PRIMARY KEY (kegiatan_id));

-- changeset liquibase:1794584573894-98 splitStatements:false
CREATE TABLE keterangan_lampiran (lampiran_id INT AUTO_INCREMENT NOT NULL, lampiran_isi TEXT NOT NULL, lampiran_surat_keterangan_id INT NOT NULL, lampiran_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_KETERANGAN_LAMPIRAN PRIMARY KEY (lampiran_id));

-- changeset liquibase:1794584573894-99 splitStatements:false
CREATE TABLE kitab (kitab_id INT AUTO_INCREMENT NOT NULL, kitab_name TEXT NOT NULL, CONSTRAINT PK_KITAB PRIMARY KEY (kitab_id));

-- changeset liquibase:1794584573894-100 splitStatements:false
CREATE TABLE kode_pengisian (kode_pengisian_id INT AUTO_INCREMENT NOT NULL, kode_pengisian_name VARCHAR(225) NOT NULL, kode_pengisian_keterangan TEXT NOT NULL, kode_pengisian_date datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_KODE_PENGISIAN PRIMARY KEY (kode_pengisian_id));

-- changeset liquibase:1794584573894-101 splitStatements:false
CREATE TABLE lainnya_guru (lainnya_guru_id INT AUTO_INCREMENT NOT NULL, lainnya_guru_no VARCHAR(225) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_LAINNYA_GURU PRIMARY KEY (lainnya_guru_id), UNIQUE (lainnya_guru_no));

-- changeset liquibase:1794584573894-102 splitStatements:false
CREATE TABLE lainnya_siswa (lainnya_siswa_id INT AUTO_INCREMENT NOT NULL, lainnya_siswa_no VARCHAR(225) NOT NULL, student_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_LAINNYA_SISWA PRIMARY KEY (lainnya_siswa_id), UNIQUE (lainnya_siswa_no));

-- changeset liquibase:1794584573894-103 splitStatements:false
CREATE TABLE layanan_publik (layanan_publik_id INT AUTO_INCREMENT NOT NULL, layanan_nama VARCHAR(225) NOT NULL, layanan_order INT NOT NULL, layanan_submenu INT NOT NULL, layanan_link VARCHAR(225) NOT NULL, CONSTRAINT PK_LAYANAN_PUBLIK PRIMARY KEY (layanan_publik_id));

-- changeset liquibase:1794584573894-104 splitStatements:false
CREATE TABLE log_error_mobile (error_id INT AUTO_INCREMENT NOT NULL, student_id VARCHAR(50) NULL, pesan_error TEXT NOT NULL, nama_menu_error VARCHAR(255) NOT NULL, line VARCHAR(50) NULL, platform VARCHAR(50) NULL, device VARCHAR(50) NULL, created_at datetime(0) NULL, CONSTRAINT PK_LOG_ERROR_MOBILE PRIMARY KEY (error_id));

-- changeset liquibase:1794584573894-105 splitStatements:false
CREATE TABLE mitra (mitra_id INT AUTO_INCREMENT NOT NULL, mitra_name VARCHAR(100) NOT NULL, mitra_note VARCHAR(200) NOT NULL, mitra_created_date datetime(0) DEFAULT NOW() NOT NULL, mitra_updated_date datetime(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_MITRA PRIMARY KEY (mitra_id));

-- changeset liquibase:1794584573894-106 splitStatements:false
CREATE TABLE nadhoman (nadhoman_id INT AUTO_INCREMENT NOT NULL, nadhoman_period_id INT NOT NULL, nadhoman_kitab_id INT NOT NULL, nadhoman_student_id INT NOT NULL, nadhoman_date date NULL, nadhoman_new TEXT NULL, nadhoman_note TEXT NULL, nadhoman_user_id INT NOT NULL, nadhoman_input_date timestamp(0) DEFAULT NOW() NOT NULL, nadhoman_last_update timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_NADHOMAN PRIMARY KEY (nadhoman_id));

-- changeset liquibase:1794584573894-107 splitStatements:false
CREATE TABLE pelanggaran (id INT AUTO_INCREMENT NOT NULL, pelanggaran TEXT NOT NULL, id_kategori TINYINT(3) NOT NULL, poin SMALLINT NOT NULL, CONSTRAINT PK_PELANGGARAN PRIMARY KEY (id));

-- changeset liquibase:1794584573894-108 splitStatements:false
CREATE TABLE pelayanan (id INT AUTO_INCREMENT NOT NULL, img TEXT NULL, title VARCHAR(200) NULL, link TEXT NULL, CONSTRAINT PK_PELAYANAN PRIMARY KEY (id));

-- changeset liquibase:1794584573894-109 splitStatements:false
CREATE TABLE pendayagunaan (pendayagunaan_id INT AUTO_INCREMENT NOT NULL, program_program_id INT NOT NULL, pendayagunaan_title VARCHAR(100) NOT NULL, pendayagunaan_nominal INT DEFAULT 0 NOT NULL, pendayagunaan_note TEXT NOT NULL, pendayagunaan_date date NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_PENDAYAGUNAAN PRIMARY KEY (pendayagunaan_id));

-- changeset liquibase:1794584573894-110 splitStatements:false
CREATE TABLE pengaduan (pengaduan_id INT AUTO_INCREMENT NOT NULL, pengaduan_no VARCHAR(100) NOT NULL, pengaduan_nama INT NOT NULL, pengaduan_tujuan INT NOT NULL, pengaduan_detail TEXT NOT NULL, pengaduan_status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_PENGADUAN PRIMARY KEY (pengaduan_id), UNIQUE (pengaduan_no));

-- changeset liquibase:1794584573894-111 splitStatements:false
CREATE TABLE pengajuan_izin (pengajuan_izin_id INT AUTO_INCREMENT NOT NULL, pengajuan_izin_date date NULL, pengajuan_izin_time TEXT NOT NULL, pengajuan_izin_period_id INT NOT NULL, pengajuan_izin_majors_id INT NOT NULL, pengajuan_izin_student_id INT NOT NULL, pengajuan_izin_note TEXT NOT NULL, pengajuan_izin_status VARCHAR(50) NULL, pengajuan_izin_user_id INT NULL, pengajuan_izin_created_at datetime(0) DEFAULT NOW() NULL, pengajuan_izin_updated_at datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_PENGAJUAN_IZIN PRIMARY KEY (pengajuan_izin_id));

-- changeset liquibase:1794584573894-112 splitStatements:false
CREATE TABLE pengajuan_pulang (pengajuan_pulang_id INT AUTO_INCREMENT NOT NULL, pengajuan_pulang_date date NOT NULL, pengajuan_pulang_days INT NOT NULL, pengajuan_pulang_period_id INT NOT NULL, pengajuan_pulang_majors_id INT NOT NULL, pengajuan_pulang_student_id INT NOT NULL, pengajuan_pulang_note TEXT NOT NULL, pengajuan_pulang_status VARCHAR(50) NOT NULL, pengajuan_pulang_user_id INT NULL, pengajuan_pulang_created_at datetime(0) DEFAULT NOW() NULL, pengajuan_pulang_updated_at datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_PENGAJUAN_PULANG PRIMARY KEY (pengajuan_pulang_id));

-- changeset liquibase:1794584573894-113 splitStatements:false
CREATE TABLE pengajuan_surat_masuk (id_pengajuan_s INT AUTO_INCREMENT NOT NULL, no_agenda VARCHAR(15) NOT NULL, jenis_surat VARCHAR(15) NOT NULL, tanggal_kirim datetime(0) NOT NULL, tanggal_terima datetime(0) NOT NULL, no_surat VARCHAR(50) NOT NULL, pengirim VARCHAR(50) NOT NULL, perihal VARCHAR(50) NOT NULL, nama_file VARCHAR(50) NOT NULL, CONSTRAINT PK_PENGAJUAN_SURAT_MASUK PRIMARY KEY (id_pengajuan_s));

-- changeset liquibase:1794584573894-114 splitStatements:false
CREATE TABLE potongan_setting (potongan_setting_id BIGINT AUTO_INCREMENT NOT NULL, potongan_setting_name VARCHAR(225) NULL, potongan_setting_default_id INT NULL, potongan_setting_nominal INT DEFAULT 0 NULL, potongan_setting_employee_id INT NULL, potongan_setting_date_input datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_POTONGAN_SETTING PRIMARY KEY (potongan_setting_id));

-- changeset liquibase:1794584573894-115 splitStatements:false
CREATE TABLE potongan_slip (potongan_slip_id BIGINT AUTO_INCREMENT NOT NULL, potongan_slip_name VARCHAR(225) NULL, potongan_slip_setting_id INT NULL, potongan_slip_nominal INT NULL, potongan_slip_gaji_id INT NULL, potongan_slip_date_input datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_POTONGAN_SLIP PRIMARY KEY (potongan_slip_id));

-- changeset liquibase:1794584573894-116 splitStatements:false
CREATE TABLE presensi_student (id INT AUTO_INCREMENT NOT NULL, id_student VARCHAR(45) NOT NULL, id_class INT NOT NULL, id_area_absensi INT NOT NULL, jenis_absen ENUM('DATANG', 'PULANG', 'SAKIT', 'IZIN', 'ALPHA') NOT NULL, status VARCHAR(20) NULL, date date NOT NULL, time time NOT NULL, longi VARCHAR(25) NULL, lati VARCHAR(25) NULL, note VARCHAR(50) NULL, created_date timestamp(0) DEFAULT NOW() NOT NULL, foto TEXT NULL, catatan_absen VARCHAR(50) NULL, CONSTRAINT PK_PRESENSI_STUDENT PRIMARY KEY (id));

-- changeset liquibase:1794584573894-117 splitStatements:false
CREATE TABLE prestasi (id INT AUTO_INCREMENT NOT NULL, prestasi TEXT NOT NULL, id_kategori TINYINT(3) NOT NULL, poin SMALLINT NOT NULL, CONSTRAINT PK_PRESTASI PRIMARY KEY (id));

-- changeset liquibase:1794584573894-118 splitStatements:false
CREATE TABLE program (program_id INT AUTO_INCREMENT NOT NULL, program_name VARCHAR(100) NULL, program_description TEXT NULL, account_account_id CHAR(10) NOT NULL, pendayagunaan_account_id INT NULL, program_gambar TEXT NULL, program_end date NOT NULL, program_target INT NOT NULL, program_earn INT DEFAULT 0 NULL, program_realisasi INT DEFAULT 0 NULL, program_status INT NOT NULL, program_created_at timestamp(0) DEFAULT NOW() NOT NULL, program_updated_at timestamp(0) DEFAULT null on update CURRENT_TIMESTAMP NULL, CONSTRAINT PK_PROGRAM PRIMARY KEY (program_id));

-- changeset liquibase:1794584573894-119 splitStatements:false
CREATE TABLE province (province_id CHAR(2) NOT NULL, province_name TINYTEXT NOT NULL, CONSTRAINT PK_PROVINCE PRIMARY KEY (province_id));

-- changeset liquibase:1794584573894-120 splitStatements:false
CREATE TABLE publik (publik_id INT AUTO_INCREMENT NOT NULL, publik_no VARCHAR(50) NOT NULL, publik_nama VARCHAR(225) NOT NULL, publik_alamat VARCHAR(255) NOT NULL, publik_telepon VARCHAR(50) NOT NULL, publik_nik VARCHAR(25) NOT NULL, publik_position_id INT NOT NULL, keperluan TEXT NOT NULL, publik_status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_PUBLIK PRIMARY KEY (publik_id), UNIQUE (publik_no));

-- changeset liquibase:1794584573894-121 splitStatements:false
CREATE TABLE registrasi (registrasi_id INT AUTO_INCREMENT NOT NULL, registrasi_name TEXT NULL, registrasi_school TEXT NULL, registrasi_province TEXT NULL, registrasi_city TEXT NULL, registrasi_address TEXT NULL, registrasi_email TEXT NULL, registrasi_phone TEXT NULL, registrasi_sumber VARCHAR(100) NULL, registrasi_password TEXT NULL, registrasi_input_date timestamp(0) DEFAULT NOW() NOT NULL, registrasi_last_update timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_REGISTRASI PRIMARY KEY (registrasi_id));

-- changeset liquibase:1794584573894-122 splitStatements:false
CREATE TABLE reservasi (reservasi_id INT AUTO_INCREMENT NOT NULL, reservasi_checkin date NULL, reservasi_checkout date NULL, reservasi_harga DOUBLE DEFAULT 0 NOT NULL, reservasi_total DOUBLE DEFAULT 0 NOT NULL, reservasi_status ENUM('RESERVASI', 'PAID', 'CHECKIN', 'CHECKOUT', 'CANCEL') DEFAULT 'RESERVASI' NULL, reservasi_create_at timestamp(0) DEFAULT NOW() NULL, reservasi_update_at timestamp(0) DEFAULT NOW() NULL, reservasi_ref_id VARCHAR(50) NOT NULL, reservasi_name VARCHAR(50) NOT NULL, reservasi_hp VARCHAR(50) NOT NULL, reservasi_homestay_id INT NOT NULL, CONSTRAINT PK_RESERVASI PRIMARY KEY (reservasi_id));

-- changeset liquibase:1794584573894-123 splitStatements:false
CREATE TABLE satuan (satuan_id INT AUTO_INCREMENT NOT NULL, satuan_name VARCHAR(100) NULL, CONSTRAINT PK_SATUAN PRIMARY KEY (satuan_id));

-- changeset liquibase:1794584573894-124 splitStatements:false
CREATE TABLE satuan_barang (satuan_barang_id INT AUTO_INCREMENT NOT NULL, nama_satuan VARCHAR(30) NOT NULL, keterangan VARCHAR(100) NOT NULL, CONSTRAINT PK_SATUAN_BARANG PRIMARY KEY (satuan_barang_id));

-- changeset liquibase:1794584573894-125 splitStatements:false
CREATE TABLE scheduled_emails (id INT AUTO_INCREMENT NOT NULL, recipient_email VARCHAR(255) NULL, send_at datetime(0) NULL, status ENUM('pending', 'sent', 'failed') DEFAULT 'pending' NULL, last_attempt_at datetime(0) NULL, error_message TEXT NULL, created_at datetime(0) DEFAULT NOW() NULL, CONSTRAINT PK_SCHEDULED_EMAILS PRIMARY KEY (id));

-- changeset liquibase:1794584573894-126 splitStatements:false
CREATE TABLE setting_presensi_siswa (id INT AUTO_INCREMENT NOT NULL, id_area_absensi INT NOT NULL, radius INT NOT NULL, CONSTRAINT PK_SETTING_PRESENSI_SISWA PRIMARY KEY (id));

-- changeset liquibase:1794584573894-127 splitStatements:false
CREATE TABLE siswa_ket_aktif (siswa_ket_aktif_id INT AUTO_INCREMENT NOT NULL, siswa_ket_aktif_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, keperluan VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_KET_AKTIF PRIMARY KEY (siswa_ket_aktif_id));

-- changeset liquibase:1794584573894-128 splitStatements:false
CREATE TABLE siswa_ket_baik (siswa_ket_baik_id INT AUTO_INCREMENT NOT NULL, siswa_ket_baik_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, keperluan VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_KET_BAIK PRIMARY KEY (siswa_ket_baik_id));

-- changeset liquibase:1794584573894-129 splitStatements:false
CREATE TABLE siswa_mutasi (siswa_mutasi_id INT AUTO_INCREMENT NOT NULL, siswa_mutasi_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, catatan VARCHAR(225) NOT NULL, sekolah_tujuan VARCHAR(225) NOT NULL, alamat_sekolah_tujuan TEXT NOT NULL, alasan_pindah TEXT NOT NULL, file VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_MUTASI PRIMARY KEY (siswa_mutasi_id));

-- changeset liquibase:1794584573894-130 splitStatements:false
CREATE TABLE siswa_penelitian (siswa_penelitian_id INT AUTO_INCREMENT NOT NULL, siswa_penelitian_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, anggota_id VARCHAR(225) NOT NULL, nama_kegiatan VARCHAR(225) NOT NULL, nama_instansi VARCHAR(225) NOT NULL, alamat_instansi TEXT NOT NULL, tanggal_mulai date NOT NULL, tanggal_akhir date NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_PENELITIAN PRIMARY KEY (siswa_penelitian_id));

-- changeset liquibase:1794584573894-131 splitStatements:false
CREATE TABLE siswa_prestasi (siswa_prestasi_id INT AUTO_INCREMENT NOT NULL, siswa_prestasi_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, tujuan VARCHAR(225) NOT NULL, jenis VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_PRESTASI PRIMARY KEY (siswa_prestasi_id));

-- changeset liquibase:1794584573894-132 splitStatements:false
CREATE TABLE siswa_rekomendasi (siswa_rekomendasi_id INT AUTO_INCREMENT NOT NULL, siswa_rekomendasi_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, keperluan VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, file VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_REKOMENDASI PRIMARY KEY (siswa_rekomendasi_id));

-- changeset liquibase:1794584573894-133 splitStatements:false
CREATE TABLE siswa_surat_lain (siswa_surat_lain_id INT AUTO_INCREMENT NOT NULL, siswa_surat_lain_no VARCHAR(50) NOT NULL, student_id INT NOT NULL, tujuan VARCHAR(225) NOT NULL, ditujukan VARCHAR(225) NOT NULL, catatan VARCHAR(225) NOT NULL, file VARCHAR(225) NOT NULL, status INT NOT NULL, user_id INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SISWA_SURAT_LAIN PRIMARY KEY (siswa_surat_lain_id));

-- changeset liquibase:1794584573894-134 splitStatements:false
CREATE TABLE sppd (id_sppd INT AUTO_INCREMENT NOT NULL, no_sppd VARCHAR(225) NOT NULL, perintah_id INT NOT NULL, deskripsi TEXT NOT NULL, transportasi VARCHAR(225) NOT NULL, tmp_berangkat VARCHAR(225) NOT NULL, tmp_tujuan VARCHAR(225) NOT NULL, tgl_berangkat date NOT NULL, tgl_kembali date NOT NULL, lama_perjalanan VARCHAR(11) NOT NULL, diperintah_id INT NOT NULL, anggota_id VARCHAR(225) NOT NULL, instansi_anggaran VARCHAR(225) NOT NULL, mata_anggaran VARCHAR(50) NOT NULL, dasar_surat VARCHAR(100) NOT NULL, keterangan TEXT NOT NULL, id_users INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SPPD PRIMARY KEY (id_sppd), UNIQUE (no_sppd));

-- changeset liquibase:1794584573894-135 splitStatements:false
CREATE TABLE standar (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, standar_majors_id INT NOT NULL, urutan INT DEFAULT 0 NOT NULL, standar_worksheet_id INT NOT NULL, CONSTRAINT PK_STANDAR PRIMARY KEY (id));

-- changeset liquibase:1794584573894-136 splitStatements:false
CREATE TABLE surat_cuti (surat_cuti_id INT AUTO_INCREMENT NOT NULL, surat_cuti_no VARCHAR(225) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_SURAT_CUTI PRIMARY KEY (surat_cuti_id));

-- changeset liquibase:1794584573894-137 splitStatements:false
CREATE TABLE surat_dispensasi (dispensasi_id INT AUTO_INCREMENT NOT NULL, dispensasi_nomor_surat_id VARCHAR(50) NOT NULL, dispensasi_desc TEXT NOT NULL, dispensasi_student_pj INT NOT NULL, dispensasi_student_id VARCHAR(225) NOT NULL, dispensasi_date date NOT NULL, dispensasi_time_start VARCHAR(25) NOT NULL, dispensasi_time_end VARCHAR(25) NOT NULL, dispensasi_lokasi VARCHAR(225) NOT NULL, dispensasi_users INT NOT NULL, dispensasi_input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_DISPENSASI PRIMARY KEY (dispensasi_id), UNIQUE (dispensasi_nomor_surat_id));

-- changeset liquibase:1794584573894-138 splitStatements:false
CREATE TABLE surat_jenis (id_jenis INT AUTO_INCREMENT NOT NULL, nama_jenis VARCHAR(50) NOT NULL, id_user VARCHAR(12) NOT NULL, kode_surat VARCHAR(40) NOT NULL, tanggal_create date NOT NULL, CONSTRAINT PK_SURAT_JENIS PRIMARY KEY (id_jenis));

-- changeset liquibase:1794584573894-139 splitStatements:false
CREATE TABLE surat_keterangan (keterangan_id INT AUTO_INCREMENT NOT NULL, keterangan_nomor_surat VARCHAR(50) NOT NULL, keterangan_student_id INT NOT NULL, keterangan_jenis INT NOT NULL, keterangan_users INT NOT NULL, keterangan_input_date timestamp(0) DEFAULT NOW() NOT NULL, keterangan_employee_id INT NOT NULL, CONSTRAINT PK_SURAT_KETERANGAN PRIMARY KEY (keterangan_id));

-- changeset liquibase:1794584573894-140 splitStatements:false
CREATE TABLE surat_lain_guru (surat_lain_guru_id INT AUTO_INCREMENT NOT NULL, surat_lain_guru_no VARCHAR(225) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_SURAT_LAIN_GURU PRIMARY KEY (surat_lain_guru_id));

-- changeset liquibase:1794584573894-141 splitStatements:false
CREATE TABLE surat_mengajar (surat_mengajar_id INT AUTO_INCREMENT NOT NULL, surat_mengajar_no VARCHAR(225) NOT NULL, employee_id INT NOT NULL, catatan TEXT NOT NULL, status INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, user_id INT NOT NULL, CONSTRAINT PK_SURAT_MENGAJAR PRIMARY KEY (surat_mengajar_id));

-- changeset liquibase:1794584573894-142 splitStatements:false
CREATE TABLE surat_nomor (nomor_surat VARCHAR(50) NOT NULL, tahun VARCHAR(225) NOT NULL, input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_NOMOR PRIMARY KEY (nomor_surat));

-- changeset liquibase:1794584573894-143 splitStatements:false
CREATE TABLE surat_rekomendasi (rekomendasi_id INT AUTO_INCREMENT NOT NULL, rekomendasi_nomor_surat_id VARCHAR(50) NOT NULL, rekomendasi_desc TEXT NOT NULL, rekomendasi_student_id VARCHAR(225) NOT NULL, rekomendasi_date_start date NOT NULL, rekomendasi_date_end date NOT NULL, rekomendasi_time_start VARCHAR(25) NOT NULL, rekomendasi_time_end VARCHAR(25) NOT NULL, rekomendasi_lokasi VARCHAR(225) NOT NULL, rekomendasi_users INT NOT NULL, rekomendasi_input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_REKOMENDASI PRIMARY KEY (rekomendasi_id), UNIQUE (rekomendasi_nomor_surat_id));

-- changeset liquibase:1794584573894-144 splitStatements:false
CREATE TABLE surat_tugas (id_surat_tugas INT AUTO_INCREMENT NOT NULL, no_surat_tugas VARCHAR(225) NOT NULL, employee_id INT NOT NULL, pengikut_id VARCHAR(225) NOT NULL, deskripsi TEXT NOT NULL, tgl_kegiatan date NOT NULL, tmp_kegiatan VARCHAR(225) NOT NULL, alamat_kegiatan VARCHAR(225) NOT NULL, keterangan TEXT NOT NULL, file VARCHAR(50) NOT NULL, status_surat INT NOT NULL, id_users INT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURAT_TUGAS PRIMARY KEY (id_surat_tugas));

-- changeset liquibase:1794584573894-145 splitStatements:false
CREATE TABLE survei (survei_id INT AUTO_INCREMENT NOT NULL, survei_nama VARCHAR(225) NOT NULL, survei_alamat TEXT NOT NULL, survei_respon INT NOT NULL, survei_catatan TEXT NOT NULL, tanggal_input timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_SURVEI PRIMARY KEY (survei_id));

-- changeset liquibase:1794584573894-146 splitStatements:false
CREATE TABLE tbl_disposisi (id_disposisi INT AUTO_INCREMENT NOT NULL, tujuan VARCHAR(250) NOT NULL, isi_disposisi MEDIUMTEXT NOT NULL, sifat VARCHAR(100) NOT NULL, batas_waktu date NOT NULL, catatan VARCHAR(250) NOT NULL, id_surat INT NOT NULL, id_user TINYINT(3) NOT NULL, CONSTRAINT PK_TBL_DISPOSISI PRIMARY KEY (id_disposisi));

-- changeset liquibase:1794584573894-147 splitStatements:false
CREATE TABLE tbl_group (group_id INT AUTO_INCREMENT NOT NULL, group_name VARCHAR(75) NOT NULL, group_kegiatan_id INT NULL, group_date date NULL, group_tempat VARCHAR(225) NULL, group_keterangan TEXT NULL, group_input_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_TBL_GROUP PRIMARY KEY (group_id));

-- changeset liquibase:1794584573894-148 splitStatements:false
CREATE TABLE tbl_surat_keluar (id_surat INT AUTO_INCREMENT NOT NULL, id_jenis_surat VARCHAR(50) NOT NULL, tujuan VARCHAR(250) NOT NULL, no_surat VARCHAR(50) NOT NULL, isi MEDIUMTEXT NOT NULL, kode VARCHAR(30) NOT NULL, tgl_surat date NOT NULL, tgl_catat date NOT NULL, file VARCHAR(250) NOT NULL, keterangan VARCHAR(250) NOT NULL, id_user TINYINT(3) NOT NULL, no_agenda VARCHAR(50) NOT NULL, CONSTRAINT PK_TBL_SURAT_KELUAR PRIMARY KEY (id_surat));

-- changeset liquibase:1794584573894-149 splitStatements:false
CREATE TABLE tbl_surat_masuk (id_surat INT AUTO_INCREMENT NOT NULL, no_agenda INT NOT NULL, no_surat VARCHAR(50) NOT NULL, asal_surat VARCHAR(250) NOT NULL, isi MEDIUMTEXT NOT NULL, kode VARCHAR(30) NOT NULL, indeks VARCHAR(30) NOT NULL, tgl_surat date NOT NULL, tgl_diterima date NOT NULL, file VARCHAR(250) NULL, keterangan VARCHAR(250) NOT NULL, id_user TINYINT(3) NOT NULL, disposisi ENUM('n', 'y') NOT NULL, CONSTRAINT PK_TBL_SURAT_MASUK PRIMARY KEY (id_surat));

-- changeset liquibase:1794584573894-150 splitStatements:false
CREATE TABLE teaching (teaching_id INT AUTO_INCREMENT NOT NULL, teaching_employee_id INT NOT NULL, teaching_semester_id INT NOT NULL, teaching_class_id INT NOT NULL, teaching_materi VARCHAR(225) NOT NULL, teaching_lesson_id INT NOT NULL, teaching_schedule_id INT DEFAULT 0 NOT NULL, teaching_month_id INT NOT NULL, teaching_date_create timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_TEACHING PRIMARY KEY (teaching_id));

-- changeset liquibase:1794584573894-151 splitStatements:false
CREATE TABLE templates (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(50) NOT NULL, content TEXT NOT NULL, location ENUM('PENGUMUMAN', 'PAYOUT', 'BILLING', 'SLIP', 'BANKING_IN', 'BANKING_OUT') DEFAULT 'PENGUMUMAN' NOT NULL, is_active ENUM('Y', 'N') DEFAULT 'N' NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_TEMPLATES PRIMARY KEY (id));

-- changeset liquibase:1794584573894-152 splitStatements:false
CREATE TABLE wajah (id INT AUTO_INCREMENT NOT NULL, employee_id INT NOT NULL, nama VARCHAR(50) NULL, wajah LONGTEXT NULL, CONSTRAINT PK_WAJAH PRIMARY KEY (id));

-- changeset liquibase:1794584573894-153 splitStatements:false
CREATE TABLE worksheet (worksheet_id INT AUTO_INCREMENT NOT NULL, worksheet_majors_id INT NOT NULL, worksheet_period_id INT NOT NULL, worksheet_nama_kepsek VARCHAR(100) NOT NULL, worksheet_nama_bendahara VARCHAR(100) NOT NULL, worksheet_nama_komite VARCHAR(100) NOT NULL, worksheet_nip_kepsek VARCHAR(20) NOT NULL, worksheet_nip_bendahara VARCHAR(20) NOT NULL, worksheet_email_komite VARCHAR(255) NOT NULL, worksheet_nominal FLOAT(12) DEFAULT 0 NULL, worksheet_status ENUM('A', 'B', 'TS', 'S', 'D') DEFAULT 'B' NOT NULL COMMENT 'S: Setuju
TS: Tidak Setuju
D: Diajukan
A: Aktif
B: Belum Aktif', worksheet_created_at timestamp(0) DEFAULT NOW() NOT NULL, worksheet_updated_at timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP, CONSTRAINT PK_WORKSHEET PRIMARY KEY (worksheet_id));

-- changeset liquibase:1794584573894-154 splitStatements:false
CREATE TABLE worksheet_rejection (id INT AUTO_INCREMENT NOT NULL, worksheet_id INT NOT NULL, keterangan VARCHAR(255) NULL, rejected_by INT NULL, created_at timestamp(0) DEFAULT NOW() NULL, updated_at timestamp(0) DEFAULT null on update CURRENT_TIMESTAMP NULL, CONSTRAINT PK_WORKSHEET_REJECTION PRIMARY KEY (id));

-- changeset liquibase:1794584573894-155 splitStatements:false
ALTER TABLE hutang ADD hutang_date date NULL;

-- changeset liquibase:1794584573894-156 splitStatements:false
ALTER TABLE potongan ADD potongan_tabungan INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-157 splitStatements:false
ALTER TABLE premier ADD premier_jabatan INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-158 splitStatements:false
ALTER TABLE subsatu ADD subsatu_jabatan INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-159 splitStatements:false
ALTER TABLE subtiga ADD subtiga_tabungan INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-160 splitStatements:false
ALTER TABLE hutang ADD hutang_kreditur VARCHAR(100) NULL;

-- changeset liquibase:1794584573894-161 splitStatements:false
ALTER TABLE hutang_pay ADD hutang_pay_date date NULL;

-- changeset liquibase:1794584573894-162 splitStatements:false
ALTER TABLE student_token ADD jwt_token VARCHAR(255) NOT NULL;

-- changeset liquibase:1794584573894-163 splitStatements:false
ALTER TABLE premier ADD premier_masa_kerja INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-164 splitStatements:false
ALTER TABLE presensi_pelajaran ADD presensi_teaching_id INT NOT NULL;

-- changeset liquibase:1794584573894-165 splitStatements:false
ALTER TABLE semester ADD semester_status INT DEFAULT 0 NOT NULL;

-- changeset liquibase:1794584573894-166 splitStatements:false
ALTER TABLE subsatu ADD subsatu_masa_kerja INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-167 splitStatements:false
ALTER TABLE visit ADD visit_note TEXT NOT NULL;

-- changeset liquibase:1794584573894-168 splitStatements:false
ALTER TABLE guest_list ADD guest_list_note TEXT NOT NULL;

-- changeset liquibase:1794584573894-169 splitStatements:false
ALTER TABLE izin ADD izin_note TEXT NOT NULL;

-- changeset liquibase:1794584573894-170 splitStatements:false
ALTER TABLE log_tf ADD log_tf_balance_id TEXT NULL;

-- changeset liquibase:1794584573894-171 splitStatements:false
ALTER TABLE potongan ADD potongan_zakat INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-172 splitStatements:false
ALTER TABLE premier ADD premier_transport INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-173 splitStatements:false
ALTER TABLE saldo_awal ADD saldo_awal_nominal BIGINT DEFAULT 0 NOT NULL;

-- changeset liquibase:1794584573894-174 splitStatements:false
ALTER TABLE subsatu ADD subsatu_transport INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-175 splitStatements:false
ALTER TABLE subtiga ADD subtiga_zakat INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-176 splitStatements:false
ALTER TABLE account ADD account_status INT DEFAULT 1 NOT NULL;

-- changeset liquibase:1794584573894-177 splitStatements:false
ALTER TABLE hutang ADD hutang_account_id INT NULL;

-- changeset liquibase:1794584573894-178 splitStatements:false
ALTER TABLE konseling ADD pelanggaran_id SMALLINT DEFAULT 0 NOT NULL;

-- changeset liquibase:1794584573894-179 splitStatements:false
ALTER TABLE premier ADD premier_bpjs INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-180 splitStatements:false
ALTER TABLE subsatu ADD subsatu_bpjs INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-181 splitStatements:false
ALTER TABLE gaji ADD gaji_catatan TEXT NOT NULL;

-- changeset liquibase:1794584573894-182 splitStatements:false
ALTER TABLE premier ADD premier_yayasan INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-183 splitStatements:false
ALTER TABLE konseling ADD prestasi_id SMALLINT DEFAULT 0 NOT NULL;

-- changeset liquibase:1794584573894-184 splitStatements:false
ALTER TABLE schedule ADD schedule_jampel INT NOT NULL;

-- changeset liquibase:1794584573894-185 splitStatements:false
ALTER TABLE subsatu ADD subsatu_yayasan INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-186 splitStatements:false
ALTER TABLE izin ADD pengajuan_izin_id INT NULL;

-- changeset liquibase:1794584573894-187 splitStatements:false
ALTER TABLE premier ADD premier_kegiatan INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-188 splitStatements:false
ALTER TABLE subsatu ADD subsatu_kegiatan INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-189 splitStatements:false
ALTER TABLE premier ADD premier_koperasi INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-190 splitStatements:false
ALTER TABLE subsatu ADD subsatu_koperasi INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-191 splitStatements:false
ALTER TABLE konseling ADD bukti VARCHAR(100) NULL;

-- changeset liquibase:1794584573894-192 splitStatements:false
ALTER TABLE hutang_pay ADD hutang_pay_note VARCHAR(200) NULL;

-- changeset liquibase:1794584573894-193 splitStatements:false
ALTER TABLE premier ADD premier_mengajar_mi INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-194 splitStatements:false
ALTER TABLE subsatu ADD subsatu_mengajar_mi INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-195 splitStatements:false
ALTER TABLE premier ADD premier_mengajar_mts INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-196 splitStatements:false
ALTER TABLE subsatu ADD subsatu_mengajar_mts INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-197 splitStatements:false
ALTER TABLE konseling ADD konseling_mode VARCHAR(100) NULL;

-- changeset liquibase:1794584573894-198 splitStatements:false
ALTER TABLE premier ADD premier_mengajar_pondok INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-199 splitStatements:false
ALTER TABLE subsatu ADD subsatu_mengajar_pondok INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-200 splitStatements:false
ALTER TABLE banking ADD flip_no_trans VARCHAR(50) NULL;

-- changeset liquibase:1794584573894-201 splitStatements:false
ALTER TABLE premier ADD premier_tambahan_guru INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-202 splitStatements:false
ALTER TABLE subsatu ADD subsatu_tambahan_guru INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-203 splitStatements:false
ALTER TABLE banking ADD flip_status VARCHAR(50) NULL;

-- changeset liquibase:1794584573894-204 splitStatements:false
ALTER TABLE input_banking ADD input_flip_no_trans VARCHAR(50) NULL;

-- changeset liquibase:1794584573894-205 splitStatements:false
ALTER TABLE premier ADD premier_tambahan_mengajar INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-206 splitStatements:false
ALTER TABLE subsatu ADD subsatu_tambahan_mengajar INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-207 splitStatements:false
ALTER TABLE input_banking ADD input_flip_status VARCHAR(50) NULL;

-- changeset liquibase:1794584573894-208 splitStatements:false
ALTER TABLE premier ADD premier_pj_bos INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-209 splitStatements:false
ALTER TABLE subsatu ADD subsatu_pj_bos INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-210 splitStatements:false
ALTER TABLE premier ADD premier_pj_bop INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-211 splitStatements:false
ALTER TABLE subsatu ADD subsatu_pj_bop INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-212 splitStatements:false
ALTER TABLE premier ADD premier_rutin INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-213 splitStatements:false
ALTER TABLE subsatu ADD subsatu_rutin INT DEFAULT 0 NULL;

-- changeset liquibase:1794584573894-214 splitStatements:false
ALTER TABLE employee ADD face_recognition ENUM('true', 'false') NULL;

-- changeset liquibase:1794584573894-215 splitStatements:false
ALTER TABLE data_ipaymu_callback_tabungan ADD PRIMARY KEY (id);

-- changeset liquibase:1794584573894-216 splitStatements:false
ALTER TABLE ekskul ADD CONSTRAINT IDX_unique_name_category_majors_mentor UNIQUE (ekskul_name, ekskul_category, ekskul_majors, ekskul_mentor);

-- changeset liquibase:1794584573894-217 splitStatements:false
ALTER TABLE homestay ADD CONSTRAINT homestay_homestay_name_IDX UNIQUE (homestay_name, homestay_price, homestay_user_id);

-- changeset liquibase:1794584573894-218 splitStatements:false
ALTER TABLE tbl_surat_masuk ADD CONSTRAINT idx_unique_7_conditions UNIQUE (no_agenda, no_surat, asal_surat, kode, indeks, tgl_surat, tgl_diterima);

-- changeset liquibase:1794584573894-219 splitStatements:false
ALTER TABLE tbl_surat_keluar ADD CONSTRAINT idx_unique_idJenisSurat_noSuret_tglSurat UNIQUE (id_jenis_surat, no_surat, tgl_surat);

-- changeset liquibase:1794584573894-220 splitStatements:false
ALTER TABLE ars_jenis ADD CONSTRAINT idx_unique_jenisArsip_majorsId UNIQUE (jenis_arsip, majors_id);

-- changeset liquibase:1794584573894-221 splitStatements:false
ALTER TABLE surat_jenis ADD CONSTRAINT idx_unique_jenis_idUser_kode UNIQUE (nama_jenis, id_user, kode_surat);

-- changeset liquibase:1794584573894-222 splitStatements:false
ALTER TABLE arsip ADD CONSTRAINT idx_unique_jenis_satuan_lokasi_nama UNIQUE (id_jenis, id_satuan, lokasi, nama_arsip);

-- changeset liquibase:1794584573894-223 splitStatements:false
ALTER TABLE arsip ADD CONSTRAINT idx_unique_jenis_users_satuan_lokasi_nama UNIQUE (id_jenis, id_users, id_satuan, lokasi, nama_arsip);

-- changeset liquibase:1794584573894-224 splitStatements:false
ALTER TABLE settinghutang ADD CONSTRAINT settinghutang_period_id UNIQUE (settinghutang_period_id);

-- changeset liquibase:1794584573894-225 splitStatements:false
ALTER TABLE student ADD CONSTRAINT student_nis UNIQUE (student_nis);

-- changeset liquibase:1794584573894-226 splitStatements:false
ALTER TABLE worksheet ADD CONSTRAINT worksheet_majors_id UNIQUE (worksheet_majors_id, worksheet_period_id);

-- changeset liquibase:1794584573894-227 splitStatements:false
CREATE INDEX FK_bmt_data_absensi_area_absensi ON data_absensi_pengasuh(area_absen);

-- changeset liquibase:1794584573894-228 splitStatements:false
CREATE INDEX FK_presensi_student_area_absensi ON presensi_student(id_area_absensi);

-- changeset liquibase:1794584573894-229 splitStatements:false
CREATE INDEX REFNO_PYMTDATE_VANO ON bmi_refersal(REFNO, PYMTDATE, VANO);

-- changeset liquibase:1794584573894-230 splitStatements:false
CREATE INDEX TRXDATE_REFNO_VANO ON bmi_payment(TRXDATE, REFNO, VANO);

-- changeset liquibase:1794584573894-231 splitStatements:false
CREATE INDEX bulan ON data_absensi_pengasuh(bulan);

-- changeset liquibase:1794584573894-232 splitStatements:false
CREATE INDEX ekskul_ekskul_category_FK ON ekskul(ekskul_category);

-- changeset liquibase:1794584573894-233 splitStatements:false
CREATE INDEX fk_anggaran_account1_idx ON anggaran(anggaran_account_id);

-- changeset liquibase:1794584573894-234 splitStatements:false
CREATE INDEX fk_anggaran_period1_idx ON anggaran(anggaran_period_id);

-- changeset liquibase:1794584573894-235 splitStatements:false
CREATE INDEX id_pegawai ON data_absensi_pengasuh(id_pegawai);

-- changeset liquibase:1794584573894-236 splitStatements:false
CREATE INDEX idx_student_id ON log_error_mobile(student_id);

-- changeset liquibase:1794584573894-237 splitStatements:false
CREATE INDEX lokasi_id ON setting_presensi_siswa(id_area_absensi);

-- changeset liquibase:1794584573894-238 splitStatements:false
CREATE INDEX rejected_by ON worksheet_rejection(rejected_by);

-- changeset liquibase:1794584573894-239 splitStatements:false
CREATE INDEX status ON bmi_transaksi(status);

-- changeset liquibase:1794584573894-240 splitStatements:false
CREATE INDEX status ON ipaymu_donasi(status);

-- changeset liquibase:1794584573894-241 splitStatements:false
CREATE INDEX status ON ipaymu_penginapan(status);

-- changeset liquibase:1794584573894-242 splitStatements:false
CREATE INDEX tanggal ON data_absensi_pengasuh(tanggal);

-- changeset liquibase:1794584573894-243 splitStatements:false
CREATE INDEX time ON data_absensi_pengasuh(time);

-- changeset liquibase:1794584573894-244 splitStatements:false
CREATE INDEX worksheet_id ON worksheet_rejection(worksheet_id);

-- changeset liquibase:1794584573894-245 splitStatements:false
CREATE INDEX worksheet_period_id ON worksheet(worksheet_period_id);

-- changeset liquibase:1794584573894-246 splitStatements:false
ALTER TABLE ekskul ADD CONSTRAINT ekskul_ekskul_category_FK FOREIGN KEY (ekskul_category) REFERENCES ekskul_category (id) ON UPDATE RESTRICT ON DELETE SET NULL;

-- changeset liquibase:1794584573894-247 splitStatements:false
ALTER TABLE setting_presensi_siswa ADD CONSTRAINT setting_presensi_siswa_ibfk_1 FOREIGN KEY (id_area_absensi) REFERENCES area_absensi (id_area) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- changeset liquibase:1794584573894-248 splitStatements:false
ALTER TABLE worksheet ADD CONSTRAINT worksheet_ibfk_2 FOREIGN KEY (worksheet_period_id) REFERENCES period (period_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- changeset liquibase:1794584573894-249 splitStatements:false
ALTER TABLE worksheet ADD CONSTRAINT worksheet_ibfk_3 FOREIGN KEY (worksheet_majors_id) REFERENCES majors (majors_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- changeset liquibase:1794584573894-250 splitStatements:false
ALTER TABLE worksheet_rejection ADD CONSTRAINT worksheet_rejection_ibfk_1 FOREIGN KEY (worksheet_id) REFERENCES worksheet (worksheet_id) ON UPDATE CASCADE ON DELETE CASCADE;

-- changeset liquibase:1794584573894-251 splitStatements:false
ALTER TABLE worksheet_rejection ADD CONSTRAINT worksheet_rejection_ibfk_2 FOREIGN KEY (rejected_by) REFERENCES users (user_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794584573894-252 splitStatements:false
CREATE VIEW empl_kop_ang AS select `a`.`employee_id` AS `employee_id`,`a`.`employee_nip` AS `employee_nip`,`a`.`employee_gender` AS `employee_gender`,`a`.`employee_address` AS `employee_address`,`a`.`employee_phone` AS `employee_phone`,`a`.`employee_name` AS `employee_name`,`a`.`employee_born_place` AS `employee_born_place`,`a`.`employee_born_date` AS `employee_born_date`,`b`.`rfid` AS `rfid`,`b`.`pin` AS `pin`,117 AS `pekerjaan`,'Anggota' AS `departemen`,`b`.`status` AS `rfid_status` from (`masterep_staging`.`employee` `a` left join `masterep_staging`.`employee_cards` `b` on((`a`.`employee_nip` = `b`.`nip`))) where (`a`.`employee_status` = 1);

-- changeset liquibase:1794584573894-253 splitStatements:false
CREATE VIEW log_transfer_v AS select `masterep_staging`.`log_tf`.`log_tf_id` AS `log_tf_id`,`masterep_staging`.`log_tf`.`log_tf_date` AS `log_tf_date`,`masterep_staging`.`log_tf`.`log_tf_kredit_id` AS `log_tf_kredit_id`,`masterep_staging`.`log_tf`.`log_tf_debit_id` AS `log_tf_debit_id`,`masterep_staging`.`log_tf`.`log_tf_note` AS `log_tf_note`,`masterep_staging`.`log_tf`.`log_tf_balance_id` AS `log_tf_balance_id`,`masterep_staging`.`majors`.`majors_id` AS `majors_id`,`masterep_staging`.`majors`.`majors_short_name` AS `majors_short_name`,`masterep_staging`.`kredit`.`kredit_kas_noref` AS `kredit_kas_noref`,`masterep_staging`.`kredit`.`kredit_kas_account_id` AS `kredit_kas_account_id`,`masterep_staging`.`kredit`.`kredit_value` AS `kredit_value`,`masterep_staging`.`debit`.`debit_kas_noref` AS `debit_kas_noref`,`masterep_staging`.`debit`.`debit_kas_account_id` AS `debit_kas_account_id`,`masterep_staging`.`debit`.`debit_value` AS `debit_value`,`masterep_staging`.`debit`.`debit_date` AS `debit_date`,`masterep_staging`.`users`.`user_id` AS `user_id`,`masterep_staging`.`users`.`user_full_name` AS `user_full_name`,`masterep_staging`.`account`.`account_description` AS `account_description`,`masterep_staging`.`majors`.`majors_status` AS `majors_status` from (((((`masterep_staging`.`log_tf` left join `masterep_staging`.`kredit` on((`masterep_staging`.`kredit`.`kredit_id` = `masterep_staging`.`log_tf`.`log_tf_kredit_id`))) left join `masterep_staging`.`debit` on((`masterep_staging`.`debit`.`debit_id` = `masterep_staging`.`log_tf`.`log_tf_debit_id`))) left join `masterep_staging`.`majors` on((`masterep_staging`.`majors`.`majors_id` = `masterep_staging`.`log_tf`.`log_tf_majors_id`))) left join `masterep_staging`.`account` on((`masterep_staging`.`account`.`account_id` = `masterep_staging`.`log_tf`.`log_tf_account_id`))) left join `masterep_staging`.`users` on((`masterep_staging`.`users`.`user_id` = `masterep_staging`.`log_tf`.`log_tf_user_id`)));

-- changeset liquibase:1794584573894-254 splitStatements:false
CREATE VIEW siswa_kelas_v AS select `a`.`student_id` AS `student_id`,concat('872900022008',lpad(`a`.`student_id`,4,'0')) AS `vano`,`a`.`student_full_name` AS `nama`,`a`.`student_nis` AS `student_nis`,10000 AS `nominal` from `masterep_staging`.`student` `a`;

-- changeset liquibase:1794584573894-255 splitStatements:false
CREATE VIEW v_laba_rugi AS select `a`.`id` AS `id`,`b`.`tanggal` AS `tanggal`,`c`.`account_code` AS `kd_aktiva`,`c`.`account_description` AS `jns_trans`,sum(`a`.`debet`) AS `debet`,sum(`a`.`kredit`) AS `kredit`,`b`.`sekolah_id` AS `majors_id` from (((`masterep_staging`.`jurnal_umum_detail` `a` join `masterep_staging`.`jurnal_umum` `b` on((`a`.`id_jurnal` = `b`.`id`))) join `masterep_staging`.`kas` `k` on((`k`.`kas_noref` = `b`.`noref`))) join `masterep_staging`.`account` `c` on((`c`.`account_code` = `a`.`account_code`))) where ((`c`.`account_code` like '4%') or (`c`.`account_code` like '5%')) group by `b`.`tanggal`,`c`.`account_code`;

-- changeset liquibase:1794584573894-256 splitStatements:false
CREATE VIEW v_limit_tabungan_siswa AS select `masterep_staging`.`student`.`student_id` AS `student_id`,`masterep_staging`.`student`.`student_full_name` AS `student_full_name`,`masterep_staging`.`student`.`student_nis` AS `student_nis`,`masterep_staging`.`class`.`class_name` AS `class_name`,`masterep_staging`.`majors`.`majors_short_name` AS `majors_short_name`,coalesce(`masterep_staging`.`banking_limit`.`limit`,0) AS `withdraw_limit` from (((`masterep_staging`.`student` join `masterep_staging`.`majors` on((`masterep_staging`.`majors`.`majors_id` = `masterep_staging`.`student`.`majors_majors_id`))) join `masterep_staging`.`class` on((`masterep_staging`.`class`.`class_id` = `masterep_staging`.`student`.`class_class_id`))) left join `masterep_staging`.`banking_limit` on((`masterep_staging`.`banking_limit`.`nis` = `masterep_staging`.`student`.`student_nis`)));

-- changeset liquibase:1794584573894-257 splitStatements:false
CREATE VIEW v_tagihan_siswa AS select `bb`.`student_student_id` AS `idStudent`,`bb`.`payment_payment_id` AS `idPayment`,`py`.`period_period_id` AS `idPeriod`,0 AS `idBulan`,concat(`ps`.`pos_name`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,sum((`bb`.`bebas_bill` - `bb`.`bebas_total_pay`)) AS `total` from (((`masterep_staging`.`bebas` `bb` join `masterep_staging`.`payment` `py` on((`py`.`payment_id` = `bb`.`payment_payment_id`))) join `masterep_staging`.`pos` `ps` on((`ps`.`pos_id` = `py`.`pos_pos_id`))) join `masterep_staging`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) group by `bb`.`student_student_id`,`bb`.`payment_payment_id`,`py`.`period_period_id`,`ps`.`pos_name`,`pr`.`period_start`,`pr`.`period_end` having (`total` > 0) union all select `bl`.`student_student_id` AS `idStudent`,`bl`.`payment_payment_id` AS `idPayment`,`py`.`period_period_id` AS `idPeriod`,`bl`.`month_month_id` AS `idBulan`,concat(`ps`.`pos_name`,' - ',`mnt`.`month_name`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,sum(`bl`.`bulan_bill`) AS `total` from ((((`masterep_staging`.`bulan` `bl` join `masterep_staging`.`month` `mnt` on((`mnt`.`month_id` = `bl`.`month_month_id`))) join `masterep_staging`.`payment` `py` on((`py`.`payment_id` = `bl`.`payment_payment_id`))) join `masterep_staging`.`pos` `ps` on((`ps`.`pos_id` = `py`.`pos_pos_id`))) join `masterep_staging`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) where ((`bl`.`bulan_status` = 0) and (`bl`.`student_student_id` is not null)) group by `bl`.`student_student_id`,`bl`.`payment_payment_id`,`py`.`period_period_id`,`bl`.`month_month_id`,`ps`.`pos_name`,`mnt`.`month_name`,`pr`.`period_start`,`pr`.`period_end`;

-- changeset liquibase:1794584573894-287 splitStatements:false
DROP TABLE token_fcm;

-- changeset liquibase:1794584573894-288 splitStatements:false
DROP TABLE token_fcm_employee;

-- changeset liquibase:1794584573894-289 splitStatements:false
ALTER TABLE gaji DROP COLUMN gaji_sekunder;

-- changeset liquibase:1794584573894-290 splitStatements:false
ALTER TABLE bebas_pay_mobile DROP COLUMN ipaymu_no_trans;

-- changeset liquibase:1794584573894-291 splitStatements:false
ALTER TABLE bebas_pay_mobile DROP COLUMN ipaymu_status;

-- changeset liquibase:1794584573894-292 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_bpjstk;

-- changeset liquibase:1794584573894-293 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_koperasi;

-- changeset liquibase:1794584573894-294 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_lain;

-- changeset liquibase:1794584573894-295 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_simpanan;

-- changeset liquibase:1794584573894-296 splitStatements:false
ALTER TABLE potongan DROP COLUMN potongan_sumbangan;

-- changeset liquibase:1794584573894-297 splitStatements:false
ALTER TABLE premier DROP COLUMN premier_lain;

-- changeset liquibase:1794584573894-298 splitStatements:false
ALTER TABLE pulang DROP COLUMN pulang_status;

-- changeset liquibase:1794584573894-299 splitStatements:false
ALTER TABLE flip_transaksi_tabungan DROP COLUMN qris;

-- changeset liquibase:1794584573894-300 splitStatements:false
ALTER TABLE subsatu DROP COLUMN subsatu_lain;

-- changeset liquibase:1794584573894-301 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_bpjstk;

-- changeset liquibase:1794584573894-302 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_koperasi;

-- changeset liquibase:1794584573894-303 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_lain;

-- changeset liquibase:1794584573894-304 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_simpanan;

-- changeset liquibase:1794584573894-305 splitStatements:false
ALTER TABLE subtiga DROP COLUMN subtiga_sumbangan;

-- changeset liquibase:1794584573894-306 splitStatements:false
DROP INDEX bebas_pay_account_id ON bebas_pay;

-- changeset liquibase:1794584573894-307 splitStatements:false
DROP INDEX bebas_pay_noref ON bebas_pay;

-- changeset liquibase:1794584573894-308 splitStatements:false
DROP INDEX bulan_account_id ON bulan;

-- changeset liquibase:1794584573894-309 splitStatements:false
DROP INDEX bulan_noref ON bulan;

-- changeset liquibase:1794584573894-310 splitStatements:false
DROP INDEX debit_account_id ON debit;

-- changeset liquibase:1794584573894-311 splitStatements:false
DROP INDEX debit_kas_noref ON debit;

-- changeset liquibase:1794584573894-312 splitStatements:false
DROP INDEX idx_trx_bebas_pay ON bebas_pay;

-- changeset liquibase:1794584573894-313 splitStatements:false
DROP INDEX idx_trx_bulan ON bulan;

-- changeset liquibase:1794584573894-314 splitStatements:false
DROP INDEX idx_trx_debit ON debit;

-- changeset liquibase:1794584573894-315 splitStatements:false
DROP INDEX idx_trx_kas ON kas;

-- changeset liquibase:1794584573894-316 splitStatements:false
DROP INDEX idx_trx_kredit ON kredit;

-- changeset liquibase:1794584573894-317 splitStatements:false
DROP INDEX kas_noref ON kas;

-- changeset liquibase:1794584573894-318 splitStatements:false
DROP INDEX kredit_account_id ON kredit;

-- changeset liquibase:1794584573894-319 splitStatements:false
DROP INDEX kredit_kas_noref ON kredit;

-- changeset liquibase:1794584573894-1 splitStatements:false
ALTER TABLE banking MODIFY banking_status INT;

-- changeset liquibase:1794584573894-2 splitStatements:false
ALTER TABLE banking ALTER banking_status DROP DEFAULT;

-- changeset liquibase:1794584573894-3 splitStatements:false
ALTER TABLE bebas_pay_mobile MODIFY bebas_pay_last_update timestamp(0) NOT NULL;

-- changeset liquibase:1794584573894-4 splitStatements:false
ALTER TABLE bebas_pay_mobile MODIFY bebas_pay_last_update timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- changeset liquibase:1794584573894-5 splitStatements:false
ALTER TABLE bulan MODIFY bulan_date_pay date;

-- changeset liquibase:1794584573894-6 splitStatements:false
ALTER TABLE debit MODIFY debit_input_date timestamp(0);

-- changeset liquibase:1794584573894-7 splitStatements:false
ALTER TABLE debit MODIFY debit_last_update timestamp(0);

-- changeset liquibase:1794584573894-8 splitStatements:false
ALTER TABLE debit_temp MODIFY debit_temp_input_date timestamp(0) NULL;

-- changeset liquibase:1794584573894-9 splitStatements:false
ALTER TABLE debit_temp MODIFY debit_temp_last_update timestamp(0);

-- changeset liquibase:1794584573894-10 splitStatements:false
ALTER TABLE employee MODIFY employee_born_date date;

-- changeset liquibase:1794584573894-11 splitStatements:false
ALTER TABLE employee MODIFY employee_end date;

-- changeset liquibase:1794584573894-12 splitStatements:false
ALTER TABLE employee MODIFY employee_start date;

-- changeset liquibase:1794584573894-13 splitStatements:false
ALTER TABLE class MODIFY grade_grade_id INT NULL;

-- changeset liquibase:1794584573894-14 splitStatements:false
ALTER TABLE kas MODIFY kas_date date;

-- changeset liquibase:1794584573894-15 splitStatements:false
ALTER TABLE kas MODIFY kas_last_update date;

-- changeset liquibase:1794584573894-16 splitStatements:false
ALTER TABLE kas MODIFY kas_last_update date NULL;

-- changeset liquibase:1794584573894-17 splitStatements:false
ALTER TABLE kredit MODIFY kredit_last_update timestamp(0);

-- changeset liquibase:1794584573894-18 splitStatements:false
ALTER TABLE kredit_temp MODIFY kredit_temp_last_update timestamp(0);

-- changeset liquibase:1794584573894-19 splitStatements:false
ALTER TABLE navmenu MODIFY menu_status INT;

-- changeset liquibase:1794584573894-20 splitStatements:false
ALTER TABLE payment MODIFY payment_is_batch ENUM('0', '1') NULL;

-- changeset liquibase:1794584573894-21 splitStatements:false
ALTER TABLE payment MODIFY payment_mode ENUM('TETAP', 'TIDAK TETAP');

-- changeset liquibase:1794584573894-22 splitStatements:false
ALTER TABLE position_history MODIFY poshistory_end date NULL;

-- changeset liquibase:1794584573894-23 splitStatements:false
ALTER TABLE position_history MODIFY poshistory_start date NULL;

-- changeset liquibase:1794584573894-24 splitStatements:false
ALTER TABLE presensi_pelajaran MODIFY presensi_pelajaran_semester_id INT NOT NULL;

-- changeset liquibase:1794584573894-25 splitStatements:false
ALTER TABLE presensi_pelajaran ALTER presensi_pelajaran_semester_id SET DEFAULT 0;

-- changeset liquibase:1794584573894-26 splitStatements:false
ALTER TABLE settinghutang MODIFY settinghutang_period_id INT NOT NULL;

-- changeset liquibase:1794584573894-27 splitStatements:false
ALTER TABLE student MODIFY student_gender VARCHAR(1);

-- changeset liquibase:1794584573894-28 splitStatements:false
ALTER TABLE student MODIFY student_password LONGTEXT;

-- changeset liquibase:1794584573894-29 splitStatements:false
ALTER TABLE flip_penginapan MODIFY tanggal date NULL;

-- changeset liquibase:1794584573894-30 splitStatements:false
ALTER TABLE jurnal_umum MODIFY tanggal date NULL;

-- changeset liquibase:1794584573894-31 splitStatements:false
ALTER TABLE teaching_history MODIFY teaching_end date NULL;

-- changeset liquibase:1794584573894-32 splitStatements:false
ALTER TABLE teaching_history MODIFY teaching_start date NULL;

-- changeset liquibase:1794584573894-33 splitStatements:false
ALTER TABLE akun_ipaymu MODIFY tipe ENUM('pembayaran', 'tabungan', 'donasi', 'aktiva tabungan', 'pasiva tabungan', 'pembayaran tabungan');

-- changeset liquibase:1794584573894-34 splitStatements:false
ALTER TABLE student_token MODIFY token_student VARCHAR(255);

-- changeset liquibase:1794584573894-35 splitStatements:false
ALTER TABLE banking MODIFY user_user_id INT NULL;

-- changeset liquibase:1794584573894-36 splitStatements:false
ALTER TABLE workshop_history MODIFY workshop_end date NULL;

-- changeset liquibase:1794584573894-37 splitStatements:false
ALTER TABLE workshop_history MODIFY workshop_start date NULL;

-- changeset liquibase:1794584573894-38 splitStatements:false
ALTER TABLE settinghutang DROP KEY settinghutang_period_id;

-- changeset liquibase:1794584573894-39 splitStatements:false
ALTER TABLE settinghutang ADD CONSTRAINT settinghutang_period_id UNIQUE (settinghutang_period_id);

-- changeset liquibase:1794584573894-40 splitStatements:false
CREATE OR REPLACE VIEW ipaymu_bulan_v AS select `a`.`bulan_id` AS `bulan_id`,`a`.`bulan_noref` AS `bulan_noref`,`a`.`bulan_account_id` AS `bulan_account_id`,`a`.`student_student_id` AS `student_student_id`,`a`.`payment_payment_id` AS `payment_payment_id`,`a`.`month_month_id` AS `month_month_id`,`a`.`bulan_bill` AS `bulan_bill`,`a`.`bulan_status` AS `bulan_status`,`a`.`bulan_number_pay` AS `bulan_number_pay`,`a`.`bulan_date_pay` AS `bulan_date_pay`,`a`.`user_user_id` AS `user_user_id`,`a`.`sekolah_id` AS `sekolah_id`,`a`.`bulan_input_date` AS `bulan_input_date`,`a`.`bulan_last_update` AS `bulan_last_update`,`a`.`ipaymu_no_trans` AS `ipaymu_no_trans`,`a`.`ipaymu_status` AS `ipaymu_status` from `masterep_staging`.`bulan` `a` where (ifnull(`a`.`ipaymu_no_trans`,0) > 0) order by `a`.`ipaymu_no_trans`;

-- changeset liquibase:1794584573894-41 splitStatements:false
CREATE OR REPLACE VIEW presensi_area_v AS select `a`.`employee_id` AS `id_pegawai`,`a`.`employee_nip` AS `nip`,`a`.`employee_name` AS `nama_pegawai`,`a`.`employee_majors_id` AS `id_unit`,`a`.`employee_position_id` AS `id_jabatan`,`a`.`status_absen` AS `status_absen`,`a`.`status_absen_temp` AS `status_absen_temp`,`a`.`area_absen` AS `area_absen`,`a`.`jarak_radius` AS `jarak_radius` from `masterep_staging`.`employee` `a`;

-- changeset liquibase:1794584573894-42 splitStatements:false
CREATE OR REPLACE VIEW v_laporan_jurnal AS select `ad`.`account_majors_id` AS `idMajors`,`bl`.`bulan_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bl`.`bulan_date_pay` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`m`.`month_name` AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`,' - ',`m`.`month_name`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bl`.`bulan_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bulan' AS `jenisTransaksi` from ((((((((`masterep_staging`.`bulan` `bl` join `masterep_staging`.`account` `ad` on((`ad`.`account_id` = `bl`.`bulan_account_id`))) join `masterep_staging`.`payment` `py` on((`py`.`payment_id` = `bl`.`payment_payment_id`))) join `masterep_staging`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep_staging`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep_staging`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep_staging`.`month` `m` on((`m`.`month_id` = `bl`.`month_month_id`))) join `masterep_staging`.`student` `s` on((`s`.`student_id` = `bl`.`student_student_id`))) join `masterep_staging`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) where ((`bl`.`bulan_status` = 1) and (`bl`.`bulan_bill` > 0)) union all select `ad`.`account_majors_id` AS `idMajors`,`bp`.`bebas_pay_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bp`.`bebas_pay_input_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,'' AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bp`.`bebas_pay_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bebas' AS `jenisTransaksi` from ((((((((`masterep_staging`.`bebas_pay` `bp` join `masterep_staging`.`bebas` `b` on((`b`.`bebas_id` = `bp`.`bebas_bebas_id`))) join `masterep_staging`.`student` `s` on((`s`.`student_id` = `b`.`student_student_id`))) join `masterep_staging`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) join `masterep_staging`.`payment` `py` on((`py`.`payment_id` = `b`.`payment_payment_id`))) join `masterep_staging`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep_staging`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep_staging`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep_staging`.`account` `ad` on((`ad`.`account_id` = `bp`.`bebas_pay_account_id`))) where (`bp`.`bebas_pay_noref` is not null) union all select `ad`.`account_majors_id` AS `idMajors`,`d`.`debit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`d`.`debit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`d`.`debit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,`d`.`debit_value` AS `penerimaan`,0 AS `pengeluaran`,'Debit' AS `jenisTransaksi` from ((`masterep_staging`.`debit` `d` join `masterep_staging`.`account` `ad` on((`ad`.`account_id` = `d`.`debit_kas_account_id`))) join `masterep_staging`.`account` `ak` on((`ak`.`account_id` = `d`.`debit_account_id`))) union all select `ad`.`account_majors_id` AS `idMajors`,`k`.`kredit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`k`.`kredit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`k`.`kredit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,0 AS `penerimaan`,`k`.`kredit_value` AS `pengeluaran`,'Kredit' AS `jenisTransaksi` from ((`masterep_staging`.`kredit` `k` join `masterep_staging`.`account` `ad` on((`ad`.`account_id` = `k`.`kredit_kas_account_id`))) join `masterep_staging`.`account` `ak` on((`ak`.`account_id` = `k`.`kredit_account_id`)));

-- changeset liquibase:1794584573894-43 splitStatements:false
CREATE OR REPLACE VIEW v_transaksi_tertunda AS select `ad`.`account_majors_id` AS `idMajors`,`bl`.`bulan_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bl`.`bulan_date_pay` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`py`.`period_period_id` AS `idPeriod`,`m`.`month_name` AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`,' - ',`m`.`month_name`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bl`.`bulan_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bulan' AS `jenisTransaksi` from ((((((((((`masterep_staging`.`bulan` `bl` join `masterep_staging`.`account` `ad` on((`ad`.`account_id` = `bl`.`bulan_account_id`))) join `masterep_staging`.`payment` `py` on((`py`.`payment_id` = `bl`.`payment_payment_id`))) join `masterep_staging`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep_staging`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep_staging`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep_staging`.`month` `m` on((`m`.`month_id` = `bl`.`month_month_id`))) join `masterep_staging`.`student` `s` on((`s`.`student_id` = `bl`.`student_student_id`))) join `masterep_staging`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) left join `masterep_staging`.`kas` `ks` on((`ks`.`kas_noref` = `bl`.`bulan_noref`))) left join `masterep_staging`.`jurnal_umum` `ju` on((`ju`.`noref` = `bl`.`bulan_noref`))) where ((`bl`.`bulan_status` = 1) and (`bl`.`bulan_bill` > 0) and (`ks`.`kas_noref` is null) and (`ju`.`noref` is null)) union all select `ad`.`account_majors_id` AS `idMajors`,`bp`.`bebas_pay_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bp`.`bebas_pay_input_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`py`.`period_period_id` AS `idPeriod`,'' AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bp`.`bebas_pay_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bebas' AS `jenisTransaksi` from ((((((((((`masterep_staging`.`bebas_pay` `bp` join `masterep_staging`.`bebas` `b` on((`b`.`bebas_id` = `bp`.`bebas_bebas_id`))) join `masterep_staging`.`student` `s` on((`s`.`student_id` = `b`.`student_student_id`))) join `masterep_staging`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) join `masterep_staging`.`payment` `py` on((`py`.`payment_id` = `b`.`payment_payment_id`))) join `masterep_staging`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep_staging`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep_staging`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep_staging`.`account` `ad` on((`ad`.`account_id` = `bp`.`bebas_pay_account_id`))) left join `masterep_staging`.`kas` `ks` on((`ks`.`kas_noref` = `bp`.`bebas_pay_noref`))) left join `masterep_staging`.`jurnal_umum` `ju` on((`ju`.`noref` = `bp`.`bebas_pay_noref`))) where ((`bp`.`bebas_pay_noref` is not null) and (`ks`.`kas_noref` is null) and (`ju`.`noref` is null));

