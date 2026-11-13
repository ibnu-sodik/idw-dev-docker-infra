-- liquibase formatted sql

-- changeset liquibase:1794382114600-1 splitStatements:false
CREATE TABLE absensi_khusus (id INT AUTO_INCREMENT NOT NULL, tanggal date NULL, id_pegawai INT DEFAULT 0 NULL, lokasi_absen INT DEFAULT 0 NULL, remark TEXT NULL, created_by INT DEFAULT 0 NULL, created_date datetime(0) NULL, updated_by INT DEFAULT 0 NULL, updated_date datetime(0) NULL, CONSTRAINT PK_ABSENSI_KHUSUS PRIMARY KEY (id));

-- changeset liquibase:1794382114600-2 splitStatements:false
CREATE TABLE account (account_id INT AUTO_INCREMENT NOT NULL, account_code VARCHAR(20) NOT NULL, account_description TEXT NOT NULL, account_note INT NOT NULL, account_category INT NOT NULL, account_majors_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_ACCOUNT PRIMARY KEY (account_id));

-- changeset liquibase:1794382114600-3 splitStatements:false
CREATE TABLE akun (akun_id INT AUTO_INCREMENT NOT NULL, akun_account_id INT NOT NULL, akun_employee_id INT NOT NULL, akun_sekolah_id INT NOT NULL, CONSTRAINT PK_AKUN PRIMARY KEY (akun_id));

-- changeset liquibase:1794382114600-4 splitStatements:false
CREATE TABLE alumni (alumni_id INT AUTO_INCREMENT NOT NULL, alumni_nis VARCHAR(45) NULL, alumni_nisn VARCHAR(45) NULL, alumni_full_name VARCHAR(255) NULL, alumni_gender ENUM('L', 'P') NULL, alumni_born_place VARCHAR(45) NULL, alumni_born_date date NULL, alumni_img VARCHAR(255) NULL, alumni_phone VARCHAR(45) NULL, alumni_hobby VARCHAR(100) NULL, alumni_address TEXT NULL, alumni_name_of_mother VARCHAR(255) NULL, alumni_name_of_father VARCHAR(255) NULL, alumni_parent_phone VARCHAR(45) NULL, alumni_unit INT NULL, alumni_kelas INT NULL, alumni_tahun_id INT NULL, alumni_input_date timestamp(0) DEFAULT NOW() NULL, alumni_last_update timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_ALUMNI PRIMARY KEY (alumni_id));

-- changeset liquibase:1794382114600-5 splitStatements:false
CREATE TABLE area_absensi (id_area INT AUTO_INCREMENT NOT NULL, nama_area VARCHAR(100) NULL, longi VARCHAR(100) NULL, lati VARCHAR(100) NULL, remark TEXT NULL, created_by INT DEFAULT 0 NOT NULL, created_date datetime(0) NULL, updated_by INT DEFAULT 0 NOT NULL, updated_date datetime(0) NULL, CONSTRAINT PK_AREA_ABSENSI PRIMARY KEY (id_area));

-- changeset liquibase:1794382114600-6 splitStatements:false
CREATE TABLE banking (banking_id INT AUTO_INCREMENT NOT NULL, banking_period_id INT NOT NULL, banking_account_id INT NULL, banking_debit INT NOT NULL, banking_kredit INT NOT NULL, banking_date date NOT NULL, banking_code INT NOT NULL, banking_student_id INT NOT NULL, banking_note TEXT NOT NULL, user_user_id INT NOT NULL, CONSTRAINT PK_BANKING PRIMARY KEY (banking_id));

-- changeset liquibase:1794382114600-7 splitStatements:false
CREATE TABLE bebas (bebas_id INT AUTO_INCREMENT NOT NULL, student_student_id INT NULL, payment_payment_id INT NULL, bebas_bill DECIMAL(10) NULL, bebas_diskon DECIMAL(10) DEFAULT 0 NOT NULL, bebas_total_pay DECIMAL(10) DEFAULT 0 NULL, sekolah_id CHAR(100) NOT NULL, bebas_input_date date NULL, bebas_last_update date NULL, CONSTRAINT PK_BEBAS PRIMARY KEY (bebas_id));

-- changeset liquibase:1794382114600-8 splitStatements:false
CREATE TABLE bebas_pay (bebas_pay_id INT AUTO_INCREMENT NOT NULL, bebas_bebas_id INT NULL, bebas_pay_noref VARCHAR(50) NOT NULL, bebas_pay_account_id INT NOT NULL, bebas_pay_number VARCHAR(100) NULL, bebas_pay_bill DECIMAL(10) NULL, bebas_pay_desc VARCHAR(100) NULL, user_user_id INT NULL, sekolah_id CHAR(100) NOT NULL, bebas_pay_input_date date NULL, bebas_pay_last_update timestamp(0) NULL, CONSTRAINT PK_BEBAS_PAY PRIMARY KEY (bebas_pay_id));

-- changeset liquibase:1794382114600-9 splitStatements:false
CREATE TABLE bobot (id INT UNSIGNED AUTO_INCREMENT NOT NULL, empl_id INT UNSIGNED NOT NULL, absensi INT DEFAULT 30 NOT NULL, harian INT DEFAULT 30 NOT NULL, sumatif INT DEFAULT 40 NOT NULL, period_period_id INT NOT NULL, CONSTRAINT PK_BOBOT PRIMARY KEY (id));

-- changeset liquibase:1794382114600-10 splitStatements:false
CREATE TABLE bulan (bulan_id INT AUTO_INCREMENT NOT NULL, bulan_noref VARCHAR(50) NULL, bulan_account_id INT NULL, student_student_id INT NULL, payment_payment_id INT NULL, month_month_id INT NULL, bulan_bill DECIMAL(10) NULL, bulan_status TINYINT(1) DEFAULT 0 NULL, bulan_number_pay VARCHAR(100) NULL, bulan_date_pay date NULL, user_user_id INT NULL, sekolah_id CHAR(100) NOT NULL, bulan_input_date timestamp(0) NULL, bulan_last_update timestamp(0) NULL, CONSTRAINT PK_BULAN PRIMARY KEY (bulan_id));

-- changeset liquibase:1794382114600-11 splitStatements:false
CREATE TABLE ci_sessions (id VARCHAR(40) NOT NULL, ip_address VARCHAR(45) NOT NULL, timestamp INT UNSIGNED DEFAULT 0 NOT NULL, data BLOB NOT NULL, CONSTRAINT PK_CI_SESSIONS PRIMARY KEY (id));

-- changeset liquibase:1794382114600-12 splitStatements:false
CREATE TABLE class (class_id INT AUTO_INCREMENT NOT NULL, class_name VARCHAR(45) NULL, majors_majors_id INT NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_CLASS PRIMARY KEY (class_id));

-- changeset liquibase:1794382114600-13 splitStatements:false
CREATE TABLE data_absensi (id INT AUTO_INCREMENT NOT NULL, id_pegawai INT NOT NULL, jenis_absen VARCHAR(100) NULL, statushadir VARCHAR(50) NULL, area_absen INT NOT NULL, bulan VARCHAR(100) NULL, tanggal date NULL, time VARCHAR(100) NULL, jam timestamp(0) DEFAULT NOW() NULL, longi VARCHAR(100) NULL, lati VARCHAR(100) NULL, lokasi VARCHAR(50) NULL, month VARCHAR(50) NULL, year VARCHAR(50) NULL, keterlambatan TEXT NULL, foto TEXT NULL, catatan_absen TEXT NULL, remark TEXT NULL, created_by VARCHAR(100) NULL, created_date VARCHAR(100) NULL, updated_by VARCHAR(100) NULL, updated_date VARCHAR(100) NULL, CONSTRAINT PK_DATA_ABSENSI PRIMARY KEY (id));

-- changeset liquibase:1794382114600-14 splitStatements:false
CREATE TABLE data_waktu (data_waktu_id INT AUTO_INCREMENT NOT NULL, data_waktu_majors_id INT NOT NULL, data_waktu_day_id INT NOT NULL, data_waktu_masuk time NOT NULL, data_waktu_pulang time NOT NULL, CONSTRAINT PK_DATA_WAKTU PRIMARY KEY (data_waktu_id));

-- changeset liquibase:1794382114600-15 splitStatements:false
CREATE TABLE day (day_id INT AUTO_INCREMENT NOT NULL, day_name TEXT NOT NULL, CONSTRAINT PK_DAY PRIMARY KEY (day_id));

-- changeset liquibase:1794382114600-16 splitStatements:false
CREATE TABLE debit (debit_id INT AUTO_INCREMENT NOT NULL, debit_date date NULL, debit_desc VARCHAR(100) NULL, debit_value DECIMAL(10) NULL, debit_account_id INT NOT NULL, debit_kas_noref VARCHAR(50) NOT NULL, debit_kas_account_id INT NOT NULL, debit_tax_id INT NOT NULL, debit_item_id INT NOT NULL, user_user_id INT NULL, sekolah_id CHAR(100) NOT NULL, debit_input_date timestamp(0) NULL, debit_last_update timestamp(0) NULL, CONSTRAINT PK_DEBIT PRIMARY KEY (debit_id));

-- changeset liquibase:1794382114600-17 splitStatements:false
CREATE TABLE debit_temp (debit_temp_id INT AUTO_INCREMENT NOT NULL, debit_temp_majors_id INT NOT NULL, debit_temp_date date NOT NULL, debit_temp_noref VARCHAR(50) NOT NULL, debit_temp_kas_account_id INT NOT NULL, debit_temp_account_id INT NOT NULL, debit_temp_desc VARCHAR(50) NOT NULL, debit_temp_value DECIMAL(11) NOT NULL, debit_temp_tax_id INT NOT NULL, debit_temp_item_id INT NOT NULL, user_user_id INT NOT NULL, debit_temp_input_date timestamp(0) DEFAULT NOW() NOT NULL, debit_temp_last_update timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, CONSTRAINT PK_DEBIT_TEMP PRIMARY KEY (debit_temp_id));

-- changeset liquibase:1794382114600-18 splitStatements:false
CREATE TABLE employee (employee_id INT AUTO_INCREMENT NOT NULL, employee_nip VARCHAR(20) NULL, employee_name VARCHAR(50) NULL, employee_gender CHAR(2) NULL, employee_position_id INT NULL, employee_majors_id INT NULL, employee_category INT NULL, employee_born_place VARCHAR(20) NULL, employee_born_date date NULL, employee_strata CHAR(5) NULL, employee_phone VARCHAR(15) NULL, employee_address TEXT NULL, employee_photo TEXT NULL, employee_start date NULL, employee_end date NULL, employee_status INT DEFAULT 1 NULL, employee_email VARCHAR(50) NULL, employee_password VARCHAR(100) NULL, sekolah_id INT NULL, status_absen ENUM('Y', 'N') DEFAULT 'Y' NULL, status_absen_temp ENUM('LOCK', 'UNLOCK') DEFAULT 'LOCK' NULL, area_absen INT DEFAULT 1 NOT NULL, jarak_radius INT DEFAULT 500 NOT NULL, employee_input_date timestamp(0) DEFAULT NOW() NOT NULL, employee_last_update timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, CONSTRAINT PK_EMPLOYEE PRIMARY KEY (employee_id));

-- changeset liquibase:1794382114600-19 splitStatements:false
CREATE TABLE employee_achievement (achievement_id INT AUTO_INCREMENT NOT NULL, achievement_year CHAR(5) NOT NULL, achievement_name VARCHAR(50) NOT NULL, achievement_employee_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_EMPLOYEE_ACHIEVEMENT PRIMARY KEY (achievement_id));

-- changeset liquibase:1794382114600-20 splitStatements:false
CREATE TABLE employee_education (education_id INT AUTO_INCREMENT NOT NULL, education_start CHAR(5) NOT NULL, education_end CHAR(5) NOT NULL, education_name VARCHAR(50) NOT NULL, education_location VARCHAR(50) NOT NULL, education_employee_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_EMPLOYEE_EDUCATION PRIMARY KEY (education_id));

-- changeset liquibase:1794382114600-21 splitStatements:false
CREATE TABLE employee_fam (fam_id INT AUTO_INCREMENT NOT NULL, fam_name VARCHAR(50) NOT NULL, fam_desc INT NOT NULL, fam_employee_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_EMPLOYEE_FAM PRIMARY KEY (fam_id));

-- changeset liquibase:1794382114600-22 splitStatements:false
CREATE TABLE gaji (gaji_id INT AUTO_INCREMENT NOT NULL, gaji_pokok INT NOT NULL, gaji_sekunder INT NOT NULL, gaji_potongan INT NOT NULL, gaji_jumlah INT NOT NULL, gaji_month_id INT NOT NULL, gaji_period_id INT NOT NULL, gaji_employee_id INT NOT NULL, gaji_tanggal timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, user_user_id INT NOT NULL, CONSTRAINT PK_GAJI PRIMARY KEY (gaji_id));

-- changeset liquibase:1794382114600-23 splitStatements:false
CREATE TABLE grade (grade_id INT AUTO_INCREMENT NOT NULL, grade_name TEXT NOT NULL, CONSTRAINT PK_GRADE PRIMARY KEY (grade_id));

-- changeset liquibase:1794382114600-24 splitStatements:false
CREATE TABLE guest (guest_id INT AUTO_INCREMENT NOT NULL, guest_name TEXT NOT NULL, guest_mahram_id INT NOT NULL, guest_student_id INT NOT NULL, CONSTRAINT PK_GUEST PRIMARY KEY (guest_id));

-- changeset liquibase:1794382114600-25 splitStatements:false
CREATE TABLE guest_list (guest_list_id INT AUTO_INCREMENT NOT NULL, guest_list_code TEXT NOT NULL, guest_list_date date NOT NULL, guest_list_time TEXT NULL, guest_list_student_id INT NOT NULL, guest_list_period_id INT NOT NULL, guest_list_user_id INT NOT NULL, guest_list_created_date timestamp(0) DEFAULT NOW() NOT NULL, guest_list_updated_date timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_GUEST_LIST PRIMARY KEY (guest_list_id));

-- changeset liquibase:1794382114600-26 splitStatements:false
CREATE TABLE hak_akses (hak_akses_id INT AUTO_INCREMENT NOT NULL, menu_id INT NOT NULL, role_id INT NOT NULL, CONSTRAINT PK_HAK_AKSES PRIMARY KEY (hak_akses_id));

-- changeset liquibase:1794382114600-27 splitStatements:false
CREATE TABLE harian (harian_id INT AUTO_INCREMENT NOT NULL, harian_period_id INT NOT NULL, harian_semester_id INT NOT NULL, harian_teacher_id INT NOT NULL, harian_lesson_id INT NOT NULL, harian_student_id INT NOT NULL, harian_1 INT NULL, harian_2 INT NULL, harian_3 INT NULL, harian_4 INT NULL, harian_5 INT NULL, harian_6 INT NULL, harian_7 INT NULL, harian_8 INT NULL, harian_9 INT NULL, harian_10 INT NULL, harian_11 INT NULL, CONSTRAINT PK_HARIAN PRIMARY KEY (harian_id));

-- changeset liquibase:1794382114600-28 splitStatements:false
CREATE TABLE holiday (id INT AUTO_INCREMENT NOT NULL, year YEAR(4) NULL, date date NULL, info VARCHAR(255) NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_HOLIDAY PRIMARY KEY (id));

-- changeset liquibase:1794382114600-29 splitStatements:false
CREATE TABLE hutang (hutang_id INT AUTO_INCREMENT NOT NULL, hutang_noref VARCHAR(25) NOT NULL, hutang_employee_id INT NULL, hutang_settinghutang_id INT NULL, hutang_bill DECIMAL(10) NULL, sekolah_id CHAR(100) NOT NULL, hutang_input_date date NULL, hutang_last_update date NULL, hutang_date date NULL, hutang_kreditur VARCHAR(100) NULL, hutang_account_id INT NULL, CONSTRAINT PK_HUTANG PRIMARY KEY (hutang_id));

-- changeset liquibase:1794382114600-30 splitStatements:false
CREATE TABLE hutang_pay (hutang_pay_id INT AUTO_INCREMENT NOT NULL, hutang_pay_hutang_id INT NULL, hutang_pay_noref VARCHAR(50) NOT NULL, hutang_pay_account_id INT DEFAULT 0 NOT NULL, hutang_pay_number VARCHAR(100) DEFAULT '0' NULL, hutang_pay_status INT DEFAULT 0 NOT NULL, hutang_pay_bill DECIMAL(10) NULL, user_user_id INT NULL, sekolah_id CHAR(100) NOT NULL, hutang_pay_input_date date NULL, hutang_pay_last_update date NULL, hutang_pay_date date NULL, hutang_pay_note VARCHAR(200) NULL, CONSTRAINT PK_HUTANG_PAY PRIMARY KEY (hutang_pay_id));

-- changeset liquibase:1794382114600-31 splitStatements:false
CREATE TABLE info_app (id INT AUTO_INCREMENT NOT NULL, student_id INT NULL, info TEXT NULL, created_at date NULL, CONSTRAINT PK_INFO_APP PRIMARY KEY (id));

-- changeset liquibase:1794382114600-32 splitStatements:false
CREATE TABLE information (information_id INT AUTO_INCREMENT NOT NULL, information_title VARCHAR(100) NULL, information_desc TEXT NULL, information_img VARCHAR(255) NULL, information_publish TINYINT(1) DEFAULT 0 NULL, user_user_id INT NULL, sekolah_id CHAR(100) NOT NULL, information_input_date timestamp(0) NULL, information_last_update timestamp(0) NULL, CONSTRAINT PK_INFORMATION PRIMARY KEY (information_id));

-- changeset liquibase:1794382114600-33 splitStatements:false
CREATE TABLE item (item_id INT AUTO_INCREMENT NOT NULL, item_name VARCHAR(50) NOT NULL, item_majors_id INT NOT NULL, CONSTRAINT PK_ITEM PRIMARY KEY (item_id));

-- changeset liquibase:1794382114600-34 splitStatements:false
CREATE TABLE izin (izin_id INT AUTO_INCREMENT NOT NULL, izin_date date NOT NULL, izin_time TEXT NOT NULL, izin_period_id INT NOT NULL, izin_student_id INT NOT NULL, izin_user_id INT NOT NULL, CONSTRAINT PK_IZIN PRIMARY KEY (izin_id));

-- changeset liquibase:1794382114600-35 splitStatements:false
CREATE TABLE izin_detail (izin_detail_id INT AUTO_INCREMENT NOT NULL, izin_detail_schedule_id INT NOT NULL, izin_detail_task TEXT NOT NULL, izin_detail_izin_id INT NOT NULL, CONSTRAINT PK_IZIN_DETAIL PRIMARY KEY (izin_detail_id));

-- changeset liquibase:1794382114600-36 splitStatements:false
CREATE TABLE izin_guru (izin_guru_id INT AUTO_INCREMENT NOT NULL, izin_guru_date date NOT NULL, izin_guru_note TEXT NOT NULL, izin_guru_file TEXT NOT NULL, izin_guru_employee_id INT NOT NULL, CONSTRAINT PK_IZIN_GURU PRIMARY KEY (izin_guru_id));

-- changeset liquibase:1794382114600-37 splitStatements:false
CREATE TABLE jam_pelajaran (jam_pelajaran_id INT AUTO_INCREMENT NOT NULL, jam_pelajaran_name TEXT NULL, jam_pelajaran_start time NULL, jam_pelajaran_end time NULL, CONSTRAINT PK_JAM_PELAJARAN PRIMARY KEY (jam_pelajaran_id));

-- changeset liquibase:1794382114600-38 splitStatements:false
CREATE TABLE kas (kas_id INT AUTO_INCREMENT NOT NULL, kas_noref VARCHAR(50) NOT NULL, kas_period INT NOT NULL, kas_date date NOT NULL, kas_month_id INT NOT NULL, kas_account_id INT NOT NULL, kas_majors_id INT NOT NULL, kas_note TEXT NOT NULL, kas_category INT NOT NULL, kas_receipt TEXT NOT NULL, kas_tax_receipt TEXT NOT NULL, kas_debit INT NOT NULL, kas_kredit INT NOT NULL, kas_user_id INT NOT NULL, kas_input_date date NOT NULL, kas_last_update date NOT NULL, CONSTRAINT PK_KAS PRIMARY KEY (kas_id));

-- changeset liquibase:1794382114600-39 splitStatements:false
CREATE TABLE kesehatan (kesehatan_id INT AUTO_INCREMENT NOT NULL, kesehatan_period_id INT NOT NULL, kesehatan_student_id INT NOT NULL, kesehatan_date date NULL, kesehatan_ill TEXT NULL, kesehatan_cure TEXT NULL, kesehatan_note TEXT NULL, kesehatan_user_id INT NOT NULL, kesehatan_input_date timestamp(0) DEFAULT NOW() NOT NULL, kesehatan_last_update timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_KESEHATAN PRIMARY KEY (kesehatan_id));

-- changeset liquibase:1794382114600-40 splitStatements:false
CREATE TABLE konseling (konseling_id INT AUTO_INCREMENT NOT NULL, konseling_period_id INT NOT NULL, konseling_student_id INT NOT NULL, konseling_date date NULL, konseling_foul TEXT NULL, konseling_action TEXT NULL, konseling_poin TEXT NULL, konseling_note TEXT NULL, konseling_user_id INT NOT NULL, konseling_input_date timestamp(0) DEFAULT NOW() NOT NULL, konseling_last_update timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_KONSELING PRIMARY KEY (konseling_id));

-- changeset liquibase:1794382114600-41 splitStatements:false
CREATE TABLE kredit (kredit_id INT AUTO_INCREMENT NOT NULL, kredit_date date NULL, kredit_desc VARCHAR(100) NULL, kredit_value DECIMAL(10) NULL, kredit_account_id INT NOT NULL, kredit_gaji_id INT NULL, kredit_kas_noref VARCHAR(50) NOT NULL, kredit_kas_account_id INT NOT NULL, kredit_tax_id INT NOT NULL, kredit_item_id INT NOT NULL, user_user_id INT NULL, sekolah_id CHAR(100) NOT NULL, kredit_input_date timestamp(0) NULL, kredit_last_update timestamp(0) NULL, CONSTRAINT PK_KREDIT PRIMARY KEY (kredit_id));

-- changeset liquibase:1794382114600-42 splitStatements:false
CREATE TABLE kredit_temp (kredit_temp_id INT AUTO_INCREMENT NOT NULL, kredit_temp_majors_id INT NOT NULL, kredit_temp_date date NOT NULL, kredit_temp_noref VARCHAR(50) NOT NULL, kredit_temp_kas_account_id INT NOT NULL, kredit_temp_account_id INT NOT NULL, kredit_temp_desc VARCHAR(50) NOT NULL, kredit_temp_value DECIMAL(11) NOT NULL, kredit_temp_tax_id INT NOT NULL, kredit_temp_item_id INT NOT NULL, user_user_id INT NOT NULL, kredit_temp_input_date timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, kredit_temp_last_update timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, CONSTRAINT PK_KREDIT_TEMP PRIMARY KEY (kredit_temp_id));

-- changeset liquibase:1794382114600-43 splitStatements:false
CREATE TABLE lesson (lesson_id INT AUTO_INCREMENT NOT NULL, lesson_code VARCHAR(10) NOT NULL, lesson_name TEXT NOT NULL, lesson_teacher VARCHAR(10) NOT NULL, lesson_majors_id INT NOT NULL, CONSTRAINT PK_LESSON PRIMARY KEY (lesson_id));

-- changeset liquibase:1794382114600-44 splitStatements:false
CREATE TABLE letter (letter_id INT AUTO_INCREMENT NOT NULL, letter_number VARCHAR(100) NULL, letter_month INT NULL, letter_year YEAR(4) NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_LETTER PRIMARY KEY (letter_id));

-- changeset liquibase:1794382114600-45 splitStatements:false
CREATE TABLE letter_hutang (letter_hutang_id INT AUTO_INCREMENT NOT NULL, letter_hutang_number VARCHAR(100) NULL, letter_hutang_month INT NOT NULL, letter_hutang_year YEAR(4) NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_LETTER_HUTANG PRIMARY KEY (letter_hutang_id));

-- changeset liquibase:1794382114600-46 splitStatements:false
CREATE TABLE log_hutang (log_hutang_id INT AUTO_INCREMENT NOT NULL, log_hutang_employee_id INT NULL, log_hutang_hutang_id INT NULL, log_hutang_pay_id INT NULL, sekolah_id CHAR(100) NOT NULL, log_hutang_input_date timestamp(0) NULL, log_hutang_last_update timestamp(0) NULL, user_user_id INT NULL, CONSTRAINT PK_LOG_HUTANG PRIMARY KEY (log_hutang_id));

-- changeset liquibase:1794382114600-47 splitStatements:false
CREATE TABLE log_trx (log_trx_id INT AUTO_INCREMENT NOT NULL, student_student_id INT NULL, bulan_bulan_id INT NULL, bebas_pay_bebas_pay_id INT NULL, sekolah_id CHAR(100) NOT NULL, log_trx_input_date timestamp(0) NULL, log_trx_last_update timestamp(0) NULL, CONSTRAINT PK_LOG_TRX PRIMARY KEY (log_trx_id));

-- changeset liquibase:1794382114600-48 splitStatements:false
CREATE TABLE logs (log_id INT AUTO_INCREMENT NOT NULL, log_date timestamp(0) NULL, log_action VARCHAR(45) NULL, log_module VARCHAR(45) NULL, log_info TEXT NULL, user_id INT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_LOGS PRIMARY KEY (log_id));

-- changeset liquibase:1794382114600-49 splitStatements:false
CREATE TABLE ltrx (ltrx_id INT AUTO_INCREMENT NOT NULL, ltrx_date timestamp(0) NULL, ltrx_action VARCHAR(45) NULL, ltrx_module VARCHAR(45) NULL, ltrx_info TEXT NULL, ltrx_browser TEXT NULL, ltrx_version TEXT NULL, ltrx_os TEXT NULL, ltrx_ip TEXT NULL, user_id INT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_LTRX PRIMARY KEY (ltrx_id));

-- changeset liquibase:1794382114600-50 splitStatements:false
CREATE TABLE madin (madin_id INT AUTO_INCREMENT NOT NULL, madin_name VARCHAR(45) NULL, madin_majors_id INT NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_MADIN PRIMARY KEY (madin_id));

-- changeset liquibase:1794382114600-51 splitStatements:false
CREATE TABLE mahram (mahram_id INT AUTO_INCREMENT NOT NULL, mahram_note TEXT NOT NULL, CONSTRAINT PK_MAHRAM PRIMARY KEY (mahram_id));

-- changeset liquibase:1794382114600-52 splitStatements:false
CREATE TABLE majors (majors_id INT AUTO_INCREMENT NOT NULL, majors_name VARCHAR(100) NULL, majors_short_name VARCHAR(45) NULL, majors_school_name TEXT NULL, majors_status INT DEFAULT 0 NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_MAJORS PRIMARY KEY (majors_id));

-- changeset liquibase:1794382114600-53 splitStatements:false
CREATE TABLE month (month_id INT AUTO_INCREMENT NOT NULL, month_name VARCHAR(45) NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_MONTH PRIMARY KEY (month_id));

-- changeset liquibase:1794382114600-54 splitStatements:false
CREATE TABLE navmenu (menu_id INT AUTO_INCREMENT NOT NULL, menu_nama CHAR(50) NOT NULL, menu_link CHAR(100) NOT NULL, menu_icon CHAR(30) NOT NULL, menu_child INT NOT NULL, menu_order INT NOT NULL, CONSTRAINT PK_NAVMENU PRIMARY KEY (menu_id));

-- changeset liquibase:1794382114600-55 splitStatements:false
CREATE TABLE otp (id INT AUTO_INCREMENT NOT NULL, nis VARCHAR(50) NOT NULL, code TEXT NOT NULL, expired timestamp(0) NULL, status INT DEFAULT 0 NOT NULL, created_at timestamp(0) DEFAULT NOW() NOT NULL, updated_at timestamp(0) NULL, CONSTRAINT PK_OTP PRIMARY KEY (id));

-- changeset liquibase:1794382114600-56 splitStatements:false
CREATE TABLE package (package_id INT AUTO_INCREMENT NOT NULL, package_name VARCHAR(50) NOT NULL, package_status INT DEFAULT 0 NOT NULL, CONSTRAINT PK_PACKAGE PRIMARY KEY (package_id));

-- changeset liquibase:1794382114600-57 splitStatements:false
CREATE TABLE payment (payment_id INT AUTO_INCREMENT NOT NULL, payment_type ENUM('BEBAS', 'BULAN') NULL, payment_mode ENUM('TETAP', 'TIDAK TETAP', '') NOT NULL, payment_is_batch ENUM('0', '1') DEFAULT '0' NOT NULL, period_period_id INT NULL, pos_pos_id INT NULL, sekolah_id CHAR(100) NOT NULL, payment_input_date timestamp(0) NULL, payment_last_update timestamp(0) NULL, CONSTRAINT PK_PAYMENT PRIMARY KEY (payment_id));

-- changeset liquibase:1794382114600-58 splitStatements:false
CREATE TABLE period (period_id INT AUTO_INCREMENT NOT NULL, period_start YEAR(4) NULL, period_end YEAR(4) NULL, period_status TINYINT(1) DEFAULT 0 NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_PERIOD PRIMARY KEY (period_id));

-- changeset liquibase:1794382114600-59 splitStatements:false
CREATE TABLE pesan (id INT AUTO_INCREMENT NOT NULL, id_funding INT NULL, no_wa VARCHAR(100) NULL, pesan TEXT NULL, status_kirim VARCHAR(50) DEFAULT 'PENDING' NULL, created_date VARCHAR(100) NULL, created_by VARCHAR(100) NULL, CONSTRAINT PK_PESAN PRIMARY KEY (id));

-- changeset liquibase:1794382114600-60 splitStatements:false
CREATE TABLE pos (pos_id INT AUTO_INCREMENT NOT NULL, pos_name VARCHAR(100) NULL, pos_description VARCHAR(100) NULL, account_account_id CHAR(10) NOT NULL, piutang_account_id CHAR(10) NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_POS PRIMARY KEY (pos_id));

-- changeset liquibase:1794382114600-61 splitStatements:false
CREATE TABLE poshutang (poshutang_id INT AUTO_INCREMENT NOT NULL, poshutang_name VARCHAR(100) NULL, poshutang_description VARCHAR(100) NULL, poshutang_account_id CHAR(10) NOT NULL, sekolah_id CHAR(100) NOT NULL, CONSTRAINT PK_POSHUTANG PRIMARY KEY (poshutang_id));

-- changeset liquibase:1794382114600-62 splitStatements:false
CREATE TABLE position (position_id INT AUTO_INCREMENT NOT NULL, position_code CHAR(10) NOT NULL, position_name VARCHAR(50) NOT NULL, position_category ENUM('K', 'GD', 'GL', '') NOT NULL, position_majors_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_POSITION PRIMARY KEY (position_id));

-- changeset liquibase:1794382114600-63 splitStatements:false
CREATE TABLE position_history (poshistory_id INT AUTO_INCREMENT NOT NULL, poshistory_start date NOT NULL, poshistory_end date NOT NULL, poshistory_desc TEXT NOT NULL, poshistory_employee_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_POSITION_HISTORY PRIMARY KEY (poshistory_id));

-- changeset liquibase:1794382114600-64 splitStatements:false
CREATE TABLE potongan (potongan_id INT AUTO_INCREMENT NOT NULL, potongan_simpanan INT DEFAULT 0 NULL, potongan_bpjstk INT DEFAULT 0 NULL, potongan_sumbangan INT DEFAULT 0 NULL, potongan_koperasi INT DEFAULT 0 NULL, potongan_bpjs INT DEFAULT 0 NULL, potongan_pinjaman INT DEFAULT 0 NULL, potongan_lain INT DEFAULT 0 NULL, potongan_employee_id INT NOT NULL, sekolah_id INT NULL, CONSTRAINT PK_POTONGAN PRIMARY KEY (potongan_id));

-- changeset liquibase:1794382114600-65 splitStatements:false
CREATE TABLE premier (premier_id INT AUTO_INCREMENT NOT NULL, premier_pokok INT DEFAULT 0 NULL, premier_kinerja INT NULL, premier_transport INT NULL, premier_makan INT NULL, premier_lain INT DEFAULT 0 NULL, premier_employee_id INT NOT NULL, sekolah_id INT NULL, CONSTRAINT PK_PREMIER PRIMARY KEY (premier_id));

-- changeset liquibase:1794382114600-66 splitStatements:false
CREATE TABLE presensi_guru (presensi_guru_id BIGINT AUTO_INCREMENT NOT NULL, presensi_guru_employee_id INT NOT NULL, presensi_guru_class_id INT NOT NULL, presensi_guru_schedule_id INT NOT NULL, presensi_guru_jampel_id INT NOT NULL, presensi_guru_date date NOT NULL, presensi_guru_attend ENUM('0', '1', '2') DEFAULT '0' NOT NULL, presensi_guru_created_at timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, presensi_guru_updated_at timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL, CONSTRAINT PK_PRESENSI_GURU PRIMARY KEY (presensi_guru_id));

-- changeset liquibase:1794382114600-67 splitStatements:false
CREATE TABLE presensi_harian (presensi_harian_id BIGINT AUTO_INCREMENT NOT NULL, presensi_harian_period_id INT NULL, presensi_harian_month_id INT NULL, presensi_harian_date TEXT NULL, presensi_harian_class_id INT NULL, presensi_harian_student_id INT NULL, presensi_harian_status CHAR(2) NULL, presensi_harian_created_date timestamp(0) DEFAULT NOW() NULL, presensi_harian_updated_date timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_PRESENSI_HARIAN PRIMARY KEY (presensi_harian_id));

-- changeset liquibase:1794382114600-68 splitStatements:false
CREATE TABLE presensi_pelajaran (presensi_pelajaran_id BIGINT AUTO_INCREMENT NOT NULL, presensi_teaching_id INT NOT NULL, presensi_pelajaran_period_id INT NULL, presensi_pelajaran_month_id INT NULL, presensi_pelajaran_date TEXT NULL, presensi_pelajaran_class_id INT NULL, presensi_pelajaran_lesson_id INT NULL, presensi_pelajaran_student_id INT NULL, presensi_pelajaran_status CHAR(2) NULL, presensi_pelajaran_created_date timestamp(0) DEFAULT NOW() NULL, presensi_pelajaran_updated_date timestamp(0) DEFAULT NOW() NULL, presensi_pelajaran_semester_id INT NULL, presensi_pelajaran_schedule_id INT DEFAULT 0 NOT NULL, CONSTRAINT PK_PRESENSI_PELAJARAN PRIMARY KEY (presensi_pelajaran_id));

-- changeset liquibase:1794382114600-69 splitStatements:false
CREATE TABLE prove (prove_id INT AUTO_INCREMENT NOT NULL, prove_date timestamp(0) DEFAULT NOW() NULL, prove_img TEXT NULL, prove_note TEXT NULL, prove_status INT NULL, prove_student_id INT NULL, CONSTRAINT PK_PROVE PRIMARY KEY (prove_id));

-- changeset liquibase:1794382114600-70 splitStatements:false
CREATE TABLE pulang (pulang_id INT AUTO_INCREMENT NOT NULL, pulang_date date NOT NULL, pulang_days INT NOT NULL, pulang_note TEXT NOT NULL, pulang_period_id INT NOT NULL, pulang_student_id INT NOT NULL, pulang_user_id INT NOT NULL, pulang_pengajuan_id INT NULL, CONSTRAINT PK_PULANG PRIMARY KEY (pulang_id));

-- changeset liquibase:1794382114600-71 splitStatements:false
CREATE TABLE saldo (saldo_id INT AUTO_INCREMENT NOT NULL, saldo_date date NOT NULL, saldo_debit INT NOT NULL, saldo_kredit INT NOT NULL, saldo_desc TEXT NOT NULL, saldo_banking_id INT NOT NULL, CONSTRAINT PK_SALDO PRIMARY KEY (saldo_id));

-- changeset liquibase:1794382114600-72 splitStatements:false
CREATE TABLE saldo_awal (saldo_awal_id INT AUTO_INCREMENT NOT NULL, saldo_awal_account INT NOT NULL, saldo_awal_debit INT DEFAULT 0 NOT NULL, saldo_awal_kredit INT DEFAULT 0 NOT NULL, saldo_awal_date date NOT NULL, saldo_awal_user_id INT NOT NULL, CONSTRAINT PK_SALDO_AWAL PRIMARY KEY (saldo_awal_id));

-- changeset liquibase:1794382114600-73 splitStatements:false
CREATE TABLE schedule (schedule_id INT AUTO_INCREMENT NOT NULL, schedule_semester_id INT NOT NULL, schedule_class_id INT NOT NULL, schedule_lesson_id INT NOT NULL, schedule_day TEXT NOT NULL, schedule_time TEXT NOT NULL, schedule_jampel INT NOT NULL, teaching_schedule_id INT NULL, CONSTRAINT PK_SCHEDULE PRIMARY KEY (schedule_id));

-- changeset liquibase:1794382114600-74 splitStatements:false
CREATE TABLE sekolah (sekolah_kode INT AUTO_INCREMENT NOT NULL, sekolah_id CHAR(10) NOT NULL, sekolah_nama VARCHAR(200) NOT NULL, sekolah_admin CHAR(100) NOT NULL, sekolah_email CHAR(100) NOT NULL, sekolah_password CHAR(100) NOT NULL, sekolah_status INT NOT NULL, user_input_date datetime(0) NOT NULL, user_modified_date datetime(0) NOT NULL, CONSTRAINT PK_SEKOLAH PRIMARY KEY (sekolah_kode));

-- changeset liquibase:1794382114600-75 splitStatements:false
CREATE TABLE sekunder (sekunder_id INT AUTO_INCREMENT NOT NULL, sekunder_jabatan INT NOT NULL, sekunder_bimbel INT NOT NULL, sekunder_mengajar INT NOT NULL, sekunder_transportasi INT NOT NULL, sekunder_employee_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_SEKUNDER PRIMARY KEY (sekunder_id));

-- changeset liquibase:1794382114600-76 splitStatements:false
CREATE TABLE semester (semester_id INT AUTO_INCREMENT NOT NULL, semester_name TEXT NOT NULL, semester_period_id INT NOT NULL, semester_status INT DEFAULT 0 NOT NULL, CONSTRAINT PK_SEMESTER PRIMARY KEY (semester_id));

-- changeset liquibase:1794382114600-77 splitStatements:false
CREATE TABLE setting (setting_kode INT AUTO_INCREMENT NOT NULL, setting_id INT NOT NULL, setting_name VARCHAR(255) NULL, setting_value TEXT NULL, sekolah_id CHAR(100) NOT NULL, setting_last_update timestamp(0) NULL, CONSTRAINT PK_SETTING PRIMARY KEY (setting_kode));

-- changeset liquibase:1794382114600-78 splitStatements:false
CREATE TABLE settinghutang (settinghutang_id INT AUTO_INCREMENT NOT NULL, settinghutang_period_id INT NULL, settinghutang_poshutang_id INT NULL, sekolah_id CHAR(100) NOT NULL, settinghutang_input_date timestamp(0) NULL, settinghutang_last_update timestamp(0) NULL, CONSTRAINT PK_SETTINGHUTANG PRIMARY KEY (settinghutang_id));

-- changeset liquibase:1794382114600-79 splitStatements:false
CREATE TABLE student (student_id INT AUTO_INCREMENT NOT NULL, student_nis VARCHAR(45) NULL, student_nisn VARCHAR(45) NULL, student_password VARCHAR(100) NULL, student_full_name VARCHAR(255) NULL, student_gender ENUM('L', 'P') NULL, student_born_place VARCHAR(45) NULL, student_born_date date NULL, student_img VARCHAR(255) NULL, student_phone VARCHAR(45) NULL, student_hobby VARCHAR(100) NULL, student_address TEXT NULL, student_name_of_mother VARCHAR(255) NULL, student_name_of_father VARCHAR(255) NULL, student_id_telegram VARCHAR(50) NULL, student_parent_phone VARCHAR(45) NULL, class_class_id INT NULL, majors_majors_id INT NULL, student_kelas VARCHAR(50) NOT NULL, student_madin VARCHAR(50) NULL, student_status TINYINT(1) DEFAULT 1 NULL, sekolah_id CHAR(100) NOT NULL, student_input_date timestamp(0) NULL, student_last_update timestamp(0) NULL, CONSTRAINT PK_STUDENT PRIMARY KEY (student_id));

-- changeset liquibase:1794382114600-80 splitStatements:false
CREATE TABLE student_token (token_id INT AUTO_INCREMENT NOT NULL, token_student_id INT NOT NULL, token_student VARCHAR(100) NOT NULL, update_at datetime(6) DEFAULT NOW(6) NOT NULL, CONSTRAINT PK_STUDENT_TOKEN PRIMARY KEY (token_id));

-- changeset liquibase:1794382114600-81 splitStatements:false
CREATE TABLE subdua (subdua_id INT AUTO_INCREMENT NOT NULL, subdua_num_mengajar INT NOT NULL, subdua_mengajar INT NOT NULL, subdua_num_transportasi INT NOT NULL, subdua_transportasi INT NOT NULL, subdua_num_bimbel INT NOT NULL, subdua_bimbel INT NOT NULL, subdua_jabatan INT NOT NULL, subdua_gaji_id INT NOT NULL, subdua_sekolah_id INT NOT NULL, CONSTRAINT PK_SUBDUA PRIMARY KEY (subdua_id));

-- changeset liquibase:1794382114600-82 splitStatements:false
CREATE TABLE subsatu (subsatu_id INT AUTO_INCREMENT NOT NULL, subsatu_pokok INT DEFAULT 0 NULL, subsatu_kinerja INT NULL, subsatu_transport INT NULL, subsatu_makan INT NULL, subsatu_lain INT DEFAULT 0 NULL, subsatu_gaji_id INT NOT NULL, subsatu_sekolah_id INT NULL, CONSTRAINT PK_SUBSATU PRIMARY KEY (subsatu_id));

-- changeset liquibase:1794382114600-83 splitStatements:false
CREATE TABLE subtiga (subtiga_id INT AUTO_INCREMENT NOT NULL, subtiga_simpanan INT DEFAULT 0 NULL, subtiga_bpjstk INT DEFAULT 0 NULL, subtiga_sumbangan INT DEFAULT 0 NULL, subtiga_koperasi INT DEFAULT 0 NULL, subtiga_bpjs INT DEFAULT 0 NULL, subtiga_pinjaman INT DEFAULT 0 NULL, subtiga_lain INT DEFAULT 0 NULL, subtiga_gaji_id INT NOT NULL, subtiga_sekolah_id INT NOT NULL, CONSTRAINT PK_SUBTIGA PRIMARY KEY (subtiga_id));

-- changeset liquibase:1794382114600-84 splitStatements:false
CREATE TABLE sumatif (sumatif_id INT AUTO_INCREMENT NOT NULL, sumatif_period_id INT NOT NULL, sumatif_semester_id INT NOT NULL, sumatif_teacher_id INT NOT NULL, sumatif_lesson_id INT NOT NULL, sumatif_student_id INT NOT NULL, sumatif_1 INT NULL, sumatif_2 INT NULL, sumatif_3 INT NULL, sumatif_4 INT NULL, sumatif_5 INT NULL, CONSTRAINT PK_SUMATIF PRIMARY KEY (sumatif_id));

-- changeset liquibase:1794382114600-85 splitStatements:false
CREATE TABLE tahfidz (tahfidz_id INT AUTO_INCREMENT NOT NULL, tahfidz_period_id INT NOT NULL, tahfidz_student_id INT NOT NULL, tahfidz_date date NULL, tahfidz_new TEXT NULL, tahfidz_new_note TEXT NULL, tahfidz_murojaah TEXT NULL, tahfidz_murojaah_note TEXT NULL, tahfidz_user_id INT NOT NULL, tahfidz_input_date timestamp(0) DEFAULT NOW() NOT NULL, tahfidz_last_update timestamp(0) DEFAULT NOW() NOT NULL, CONSTRAINT PK_TAHFIDZ PRIMARY KEY (tahfidz_id));

-- changeset liquibase:1794382114600-86 splitStatements:false
CREATE TABLE tax (tax_id INT AUTO_INCREMENT NOT NULL, tax_name VARCHAR(50) NOT NULL, tax_number DOUBLE NOT NULL, CONSTRAINT PK_TAX PRIMARY KEY (tax_id));

-- changeset liquibase:1794382114600-87 splitStatements:false
CREATE TABLE teaching (teaching_id INT AUTO_INCREMENT NOT NULL, teaching_schedule_id INT NULL, teaching_employee_id INT NOT NULL, teaching_semester_id INT NOT NULL, teaching_class_id INT NOT NULL, teaching_materi VARCHAR(225) NOT NULL, teaching_lesson_id INT NOT NULL, teaching_month_id INT NOT NULL, teaching_date_create timestamp(0) DEFAULT NOW() NULL, CONSTRAINT PK_TEACHING PRIMARY KEY (teaching_id));

-- changeset liquibase:1794382114600-88 splitStatements:false
CREATE TABLE teaching_history (teaching_id INT AUTO_INCREMENT NOT NULL, teaching_start date NOT NULL, teaching_end date NOT NULL, teaching_lesson VARCHAR(50) NOT NULL, teaching_desc TEXT NOT NULL, teaching_employee_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_TEACHING_HISTORY PRIMARY KEY (teaching_id));

-- changeset liquibase:1794382114600-89 splitStatements:false
CREATE TABLE token_fcm (id INT AUTO_INCREMENT NOT NULL, student_id INT NULL, token TEXT NULL, is_parent ENUM('Y', 'N') NULL, created_at datetime(0) NULL, updated_at datetime(0) NULL, CONSTRAINT PK_TOKEN_FCM PRIMARY KEY (id));

-- changeset liquibase:1794382114600-90 splitStatements:false
CREATE TABLE token_fcm_employee (id INT AUTO_INCREMENT NOT NULL, employee_id INT NULL, token TEXT NULL, created_at datetime(0) NULL, updated_at datetime(0) NULL, CONSTRAINT PK_TOKEN_FCM_EMPLOYEE PRIMARY KEY (id));

-- changeset liquibase:1794382114600-91 splitStatements:false
CREATE TABLE user_roles (role_id INT AUTO_INCREMENT NOT NULL, role_name VARCHAR(100) NULL, CONSTRAINT PK_USER_ROLES PRIMARY KEY (role_id));

-- changeset liquibase:1794382114600-92 splitStatements:false
CREATE TABLE users (user_id INT AUTO_INCREMENT NOT NULL, user_email VARCHAR(45) NULL, user_password VARCHAR(45) NULL, user_full_name VARCHAR(255) NULL, user_image VARCHAR(255) NULL, user_description TEXT NULL, user_role_role_id INT NULL, user_majors_id INT NOT NULL, sekolah_id CHAR(100) NOT NULL, sekolah_nama VARCHAR(200) NOT NULL, user_is_deleted TINYINT(1) DEFAULT 0 NULL, user_input_date timestamp(0) NULL, user_last_update timestamp(0) DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP NULL, user_password_last_update timestamp(0) NULL, CONSTRAINT PK_USERS PRIMARY KEY (user_id));

-- changeset liquibase:1794382114600-93 splitStatements:false
CREATE TABLE workshop_history (workshop_id INT AUTO_INCREMENT NOT NULL, workshop_start date NOT NULL, workshop_end date NOT NULL, workshop_organizer TEXT NOT NULL, workshop_location VARCHAR(50) NOT NULL, workshop_employee_id INT NOT NULL, sekolah_id INT NOT NULL, CONSTRAINT PK_WORKSHOP_HISTORY PRIMARY KEY (workshop_id));

-- changeset liquibase:1794382114600-94 splitStatements:false
CREATE INDEX FK_bmt_data_absensi_area_absensi ON data_absensi(area_absen);

-- changeset liquibase:1794382114600-95 splitStatements:false
CREATE INDEX bulan ON data_absensi(bulan);

-- changeset liquibase:1794382114600-96 splitStatements:false
CREATE INDEX ci_sessions_timestamp ON ci_sessions(timestamp);

-- changeset liquibase:1794382114600-97 splitStatements:false
CREATE INDEX fk_bebas_pay_bebas1_idx ON bebas_pay(bebas_bebas_id);

-- changeset liquibase:1794382114600-98 splitStatements:false
CREATE INDEX fk_bebas_pay_users1_idx ON bebas_pay(user_user_id);

-- changeset liquibase:1794382114600-99 splitStatements:false
CREATE INDEX fk_bebas_payment1_idx ON bebas(payment_payment_id);

-- changeset liquibase:1794382114600-100 splitStatements:false
CREATE INDEX fk_bebas_student1_idx ON bebas(student_student_id);

-- changeset liquibase:1794382114600-101 splitStatements:false
CREATE INDEX fk_bulan_month1_idx ON bulan(month_month_id);

-- changeset liquibase:1794382114600-102 splitStatements:false
CREATE INDEX fk_bulan_payment1_idx ON bulan(payment_payment_id);

-- changeset liquibase:1794382114600-103 splitStatements:false
CREATE INDEX fk_bulan_student1_idx ON bulan(student_student_id);

-- changeset liquibase:1794382114600-104 splitStatements:false
CREATE INDEX fk_bulan_users1_idx ON bulan(user_user_id);

-- changeset liquibase:1794382114600-105 splitStatements:false
CREATE INDEX fk_g_activity_log_g_user1_idx ON logs(user_id);

-- changeset liquibase:1794382114600-106 splitStatements:false
CREATE INDEX fk_g_activity_ltrx_g_user1_idx ON ltrx(user_id);

-- changeset liquibase:1794382114600-107 splitStatements:false
CREATE INDEX fk_hutang_employee1_idx ON hutang(hutang_employee_id);

-- changeset liquibase:1794382114600-108 splitStatements:false
CREATE INDEX fk_hutang_pay_hutang1_idx ON hutang_pay(hutang_pay_hutang_id);

-- changeset liquibase:1794382114600-109 splitStatements:false
CREATE INDEX fk_hutang_pay_users1_idx ON hutang_pay(user_user_id);

-- changeset liquibase:1794382114600-110 splitStatements:false
CREATE INDEX fk_hutang_settinghutang1_idx ON hutang(hutang_settinghutang_id);

-- changeset liquibase:1794382114600-111 splitStatements:false
CREATE INDEX fk_information_users1_idx ON information(user_user_id);

-- changeset liquibase:1794382114600-112 splitStatements:false
CREATE INDEX fk_jurnal_debit_users1_idx ON debit(user_user_id);

-- changeset liquibase:1794382114600-113 splitStatements:false
CREATE INDEX fk_jurnal_kredit_users1_idx ON kredit(user_user_id);

-- changeset liquibase:1794382114600-114 splitStatements:false
CREATE INDEX fk_log_hutang_employee_idx ON log_hutang(log_hutang_employee_id);

-- changeset liquibase:1794382114600-115 splitStatements:false
CREATE INDEX fk_log_hutang_hutang_idx ON log_hutang(log_hutang_hutang_id);

-- changeset liquibase:1794382114600-116 splitStatements:false
CREATE INDEX fk_log_hutang_hutang_pay1_idx ON log_hutang(log_hutang_pay_id);

-- changeset liquibase:1794382114600-117 splitStatements:false
CREATE INDEX fk_log_trx_bebas_pay1_idx ON log_trx(bebas_pay_bebas_pay_id);

-- changeset liquibase:1794382114600-118 splitStatements:false
CREATE INDEX fk_log_trx_bulan1_idx ON log_trx(bulan_bulan_id);

-- changeset liquibase:1794382114600-119 splitStatements:false
CREATE INDEX fk_log_trx_student1_idx ON log_trx(student_student_id);

-- changeset liquibase:1794382114600-120 splitStatements:false
CREATE INDEX fk_payment_period1_idx ON payment(period_period_id);

-- changeset liquibase:1794382114600-121 splitStatements:false
CREATE INDEX fk_payment_pos1_idx ON payment(pos_pos_id);

-- changeset liquibase:1794382114600-122 splitStatements:false
CREATE INDEX fk_poshutang_period1_idx ON settinghutang(settinghutang_period_id);

-- changeset liquibase:1794382114600-123 splitStatements:false
CREATE INDEX fk_poshutang_pos1_idx ON settinghutang(settinghutang_poshutang_id);

-- changeset liquibase:1794382114600-124 splitStatements:false
CREATE INDEX fk_student_class1_idx ON student(class_class_id);

-- changeset liquibase:1794382114600-125 splitStatements:false
CREATE INDEX fk_student_majors1_idx ON student(majors_majors_id);

-- changeset liquibase:1794382114600-126 splitStatements:false
CREATE INDEX fk_user_user_role1_idx ON users(user_role_role_id);

-- changeset liquibase:1794382114600-127 splitStatements:false
CREATE INDEX id_pegawai ON data_absensi(id_pegawai);

-- changeset liquibase:1794382114600-128 splitStatements:false
CREATE INDEX tanggal ON data_absensi(tanggal);

-- changeset liquibase:1794382114600-129 splitStatements:false
CREATE INDEX time ON data_absensi(time);

-- changeset liquibase:1794382114600-130 splitStatements:false
ALTER TABLE bebas_pay ADD CONSTRAINT fk_bebas_pay_bebas1 FOREIGN KEY (bebas_bebas_id) REFERENCES bebas (bebas_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-131 splitStatements:false
ALTER TABLE bebas_pay ADD CONSTRAINT fk_bebas_pay_users1 FOREIGN KEY (user_user_id) REFERENCES users (user_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-132 splitStatements:false
ALTER TABLE bebas ADD CONSTRAINT fk_bebas_payment1 FOREIGN KEY (payment_payment_id) REFERENCES payment (payment_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-133 splitStatements:false
ALTER TABLE bebas ADD CONSTRAINT fk_bebas_student1 FOREIGN KEY (student_student_id) REFERENCES student (student_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-134 splitStatements:false
ALTER TABLE bulan ADD CONSTRAINT fk_bulan_month1 FOREIGN KEY (month_month_id) REFERENCES month (month_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- changeset liquibase:1794382114600-135 splitStatements:false
ALTER TABLE bulan ADD CONSTRAINT fk_bulan_payment1 FOREIGN KEY (payment_payment_id) REFERENCES payment (payment_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-136 splitStatements:false
ALTER TABLE bulan ADD CONSTRAINT fk_bulan_student1 FOREIGN KEY (student_student_id) REFERENCES student (student_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-137 splitStatements:false
ALTER TABLE bulan ADD CONSTRAINT fk_bulan_users1 FOREIGN KEY (user_user_id) REFERENCES users (user_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-138 splitStatements:false
ALTER TABLE logs ADD CONSTRAINT fk_g_activity_log_g_user1 FOREIGN KEY (user_id) REFERENCES users (user_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-139 splitStatements:false
ALTER TABLE hutang_pay ADD CONSTRAINT fk_hutang_pay_hutang1 FOREIGN KEY (hutang_pay_hutang_id) REFERENCES hutang (hutang_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-140 splitStatements:false
ALTER TABLE hutang_pay ADD CONSTRAINT fk_hutang_pay_users1 FOREIGN KEY (user_user_id) REFERENCES users (user_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-141 splitStatements:false
ALTER TABLE hutang ADD CONSTRAINT fk_hutang_settinghutang1 FOREIGN KEY (hutang_settinghutang_id) REFERENCES settinghutang (settinghutang_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-142 splitStatements:false
ALTER TABLE information ADD CONSTRAINT fk_information_users1 FOREIGN KEY (user_user_id) REFERENCES users (user_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-143 splitStatements:false
ALTER TABLE debit ADD CONSTRAINT fk_jurnal_debit_users1 FOREIGN KEY (user_user_id) REFERENCES users (user_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-144 splitStatements:false
ALTER TABLE kredit ADD CONSTRAINT fk_jurnal_kredit_users1 FOREIGN KEY (user_user_id) REFERENCES users (user_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-145 splitStatements:false
ALTER TABLE log_hutang ADD CONSTRAINT fk_log_hutang_hutang1 FOREIGN KEY (log_hutang_hutang_id) REFERENCES hutang (hutang_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-146 splitStatements:false
ALTER TABLE log_hutang ADD CONSTRAINT fk_log_hutang_hutang_pay1 FOREIGN KEY (log_hutang_pay_id) REFERENCES hutang_pay (hutang_pay_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-147 splitStatements:false
ALTER TABLE log_trx ADD CONSTRAINT fk_log_trx_bebas_pay1 FOREIGN KEY (bebas_pay_bebas_pay_id) REFERENCES bebas_pay (bebas_pay_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-148 splitStatements:false
ALTER TABLE log_trx ADD CONSTRAINT fk_log_trx_bulan1 FOREIGN KEY (bulan_bulan_id) REFERENCES bulan (bulan_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-149 splitStatements:false
ALTER TABLE log_trx ADD CONSTRAINT fk_log_trx_student1 FOREIGN KEY (student_student_id) REFERENCES student (student_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-150 splitStatements:false
ALTER TABLE payment ADD CONSTRAINT fk_payment_period1 FOREIGN KEY (period_period_id) REFERENCES period (period_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-151 splitStatements:false
ALTER TABLE payment ADD CONSTRAINT fk_payment_pos1 FOREIGN KEY (pos_pos_id) REFERENCES pos (pos_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-152 splitStatements:false
ALTER TABLE settinghutang ADD CONSTRAINT fk_settinghutang_period1 FOREIGN KEY (settinghutang_period_id) REFERENCES period (period_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-153 splitStatements:false
ALTER TABLE settinghutang ADD CONSTRAINT fk_settinghutang_pos1 FOREIGN KEY (settinghutang_poshutang_id) REFERENCES poshutang (poshutang_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-154 splitStatements:false
ALTER TABLE student ADD CONSTRAINT fk_student_class1 FOREIGN KEY (class_class_id) REFERENCES class (class_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-155 splitStatements:false
ALTER TABLE student ADD CONSTRAINT fk_student_majors1 FOREIGN KEY (majors_majors_id) REFERENCES majors (majors_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- changeset liquibase:1794382114600-156 splitStatements:false
ALTER TABLE users ADD CONSTRAINT fk_user_user_role1 FOREIGN KEY (user_role_role_id) REFERENCES user_roles (role_id) ON UPDATE SET NULL ON DELETE SET NULL;

-- changeset liquibase:1794382114600-157 splitStatements:false
CREATE VIEW presensi_area_v AS select `a`.`employee_id` AS `id_pegawai`,`a`.`employee_nip` AS `nip`,`a`.`employee_name` AS `nama_pegawai`,`a`.`employee_majors_id` AS `id_unit`,`a`.`employee_position_id` AS `id_jabatan`,`a`.`status_absen` AS `status_absen`,`a`.`status_absen_temp` AS `status_absen_temp`,`a`.`area_absen` AS `area_absen`,`a`.`jarak_radius` AS `jarak_radius` from `masterep-annursulsel`.`employee` `a`;

-- changeset liquibase:1794382114600-158 splitStatements:false
CREATE VIEW v_laporan_jurnal AS select `ad`.`account_majors_id` AS `idMajors`,`bl`.`bulan_id` AS `idTransaksi`,`bl`.`bulan_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bl`.`bulan_date_pay` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`m`.`month_name` AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`,' - ',`m`.`month_name`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bl`.`bulan_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bulan' AS `jenisTransaksi` from ((((((((`masterep-annursulsel`.`bulan` `bl` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bl`.`bulan_account_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `bl`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`month` `m` on((`m`.`month_id` = `bl`.`month_month_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `bl`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) where ((`bl`.`bulan_status` = 1) and (`bl`.`bulan_bill` > 0)) union all select `ad`.`account_majors_id` AS `idMajors`,`bp`.`bebas_pay_id` AS `idTransaksi`,`bp`.`bebas_pay_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bp`.`bebas_pay_input_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,'' AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bp`.`bebas_pay_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bebas' AS `jenisTransaksi` from ((((((((`masterep-annursulsel`.`bebas_pay` `bp` join `masterep-annursulsel`.`bebas` `b` on((`b`.`bebas_id` = `bp`.`bebas_bebas_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `b`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `b`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bp`.`bebas_pay_account_id`))) where (`bp`.`bebas_pay_noref` is not null) union all select `ad`.`account_majors_id` AS `idMajors`,`d`.`debit_id` AS `idTransaksi`,`d`.`debit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`d`.`debit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`d`.`debit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,`d`.`debit_value` AS `penerimaan`,0 AS `pengeluaran`,'Debit' AS `jenisTransaksi` from ((`masterep-annursulsel`.`debit` `d` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `d`.`debit_kas_account_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `d`.`debit_account_id`))) union all select `ad`.`account_majors_id` AS `idMajors`,`k`.`kredit_id` AS `idTransaksi`,`k`.`kredit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`k`.`kredit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`k`.`kredit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,0 AS `penerimaan`,`k`.`kredit_value` AS `pengeluaran`,'Kredit' AS `jenisTransaksi` from ((`masterep-annursulsel`.`kredit` `k` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `k`.`kredit_kas_account_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `k`.`kredit_account_id`)));

-- changeset liquibase:1794382114600-159 splitStatements:false
CREATE VIEW v_laporan_jurnal_old AS select `py`.`period_period_id` AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`bl`.`bulan_id` AS `idTransaksi`,`bl`.`bulan_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bl`.`bulan_date_pay` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,`m`.`month_name` AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`,' - ',`m`.`month_name`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bl`.`bulan_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bulan' AS `jenisTransaksi` from ((((((((`masterep-annursulsel`.`bulan` `bl` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bl`.`bulan_account_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `bl`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`month` `m` on((`m`.`month_id` = `bl`.`month_month_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `bl`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) where ((`bl`.`bulan_status` = 1) and (`bl`.`bulan_bill` > 0)) union all select `py`.`period_period_id` AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`bp`.`bebas_pay_id` AS `idTransaksi`,`bp`.`bebas_pay_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`bp`.`bebas_pay_input_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`p`.`pos_name` AS `jenisBayar`,'' AS `namaBulan`,concat(`ak`.`account_description`,' - T.A ',`pr`.`period_start`,'/',`pr`.`period_end`) AS `keterangan`,`s`.`student_nis` AS `nis`,`s`.`student_full_name` AS `nama`,`c`.`class_name` AS `kelas`,`bp`.`bebas_pay_bill` AS `penerimaan`,0 AS `pengeluaran`,'Bebas' AS `jenisTransaksi` from ((((((((`masterep-annursulsel`.`bebas_pay` `bp` join `masterep-annursulsel`.`bebas` `b` on((`b`.`bebas_id` = `bp`.`bebas_bebas_id`))) join `masterep-annursulsel`.`student` `s` on((`s`.`student_id` = `b`.`student_student_id`))) join `masterep-annursulsel`.`class` `c` on((`c`.`class_id` = `s`.`class_class_id`))) join `masterep-annursulsel`.`payment` `py` on((`py`.`payment_id` = `b`.`payment_payment_id`))) join `masterep-annursulsel`.`pos` `p` on((`p`.`pos_id` = `py`.`pos_pos_id`))) join `masterep-annursulsel`.`period` `pr` on((`pr`.`period_id` = `py`.`period_period_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `p`.`account_account_id`))) join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `bp`.`bebas_pay_account_id`))) where (`bp`.`bebas_pay_noref` is not null) union all select 0 AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`d`.`debit_id` AS `idTransaksi`,`d`.`debit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`d`.`debit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`d`.`debit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,`d`.`debit_value` AS `penerimaan`,0 AS `pengeluaran`,'Debit' AS `jenisTransaksi` from ((`masterep-annursulsel`.`debit` `d` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `d`.`debit_kas_account_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `d`.`debit_account_id`))) union all select 0 AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`k`.`kredit_id` AS `idTransaksi`,`k`.`kredit_kas_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`k`.`kredit_date` AS `tanggal`,`ak`.`account_id` AS `idAkun`,`ak`.`account_code` AS `akunBayar`,`ak`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`k`.`kredit_desc` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,0 AS `penerimaan`,`k`.`kredit_value` AS `pengeluaran`,'Kredit' AS `jenisTransaksi` from ((`masterep-annursulsel`.`kredit` `k` join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `k`.`kredit_kas_account_id`))) join `masterep-annursulsel`.`account` `ak` on((`ak`.`account_id` = `k`.`kredit_account_id`))) union all select 0 AS `idPeriod`,`ac`.`account_majors_id` AS `idMajors`,`h`.`hutang_id` AS `idTransaksi`,`h`.`hutang_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`h`.`hutang_date` AS `tanggal`,`ac`.`account_id` AS `idAkun`,`ac`.`account_code` AS `akunBayar`,`ac`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`h`.`hutang_kreditur` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,`h`.`hutang_bill` AS `penerimaan`,0 AS `pengeluaran`,'Hutang' AS `jenisTransaksi` from ((((`masterep-annursulsel`.`hutang` `h` join `masterep-annursulsel`.`settinghutang` `sh` on((`sh`.`settinghutang_id` = `h`.`hutang_settinghutang_id`))) join `masterep-annursulsel`.`poshutang` `ph` on((`ph`.`poshutang_id` = `sh`.`settinghutang_poshutang_id`))) join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `h`.`hutang_account_id`))) join `masterep-annursulsel`.`account` `ac` on((`ac`.`account_id` = `ph`.`poshutang_account_id`))) union all select 0 AS `idPeriod`,`ad`.`account_majors_id` AS `idMajors`,`hp`.`hutang_pay_id` AS `idTransaksi`,`hp`.`hutang_pay_noref` AS `noref`,`ad`.`account_description` AS `namaKas`,`ad`.`account_id` AS `idKas`,`ad`.`account_code` AS `kodeKas`,`hp`.`hutang_pay_date` AS `tanggal`,`ac`.`account_id` AS `idAkun`,`ac`.`account_code` AS `akunBayar`,`ac`.`account_description` AS `jenisBayar`,'' AS `namaBulan`,`hp`.`hutang_pay_note` AS `keterangan`,'' AS `nis`,'' AS `nama`,'' AS `kelas`,0 AS `penerimaan`,`hp`.`hutang_pay_bill` AS `pengeluaran`,'Hutang' AS `jenisTransaksi` from (((((`masterep-annursulsel`.`hutang_pay` `hp` join `masterep-annursulsel`.`hutang` `h` on((`h`.`hutang_id` = `hp`.`hutang_pay_hutang_id`))) join `masterep-annursulsel`.`settinghutang` `sh` on((`sh`.`settinghutang_id` = `h`.`hutang_settinghutang_id`))) join `masterep-annursulsel`.`poshutang` `ph` on((`ph`.`poshutang_id` = `sh`.`settinghutang_poshutang_id`))) join `masterep-annursulsel`.`account` `ad` on((`ad`.`account_id` = `hp`.`hutang_pay_account_id`))) join `masterep-annursulsel`.`account` `ac` on((`ac`.`account_id` = `ph`.`poshutang_account_id`)));


-- changeset developer:plan4-demo
CREATE TABLE IF NOT EXISTS liquibase_demo_log (
    id INT AUTO_INCREMENT NOT NULL,
    action_name VARCHAR(100) NOT NULL,
    executed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_LIQUIBASE_DEMO_LOG PRIMARY KEY (id)
);

-- rollback DROP TABLE IF EXISTS liquibase_demo_log;

