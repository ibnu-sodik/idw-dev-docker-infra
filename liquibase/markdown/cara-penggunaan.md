## Summary

Dokumen ini sebagai panduan penggunaan liquibase.

## Plan

1. **Cara Penggunaan**

   Tunjukkan contoh penggunaan liquibase

2. **Test Liquibase**

   Saya sudah buat `.env` itu adalah kredensial database vm saya bagian mysql, didalamnya ada banyak database. Apakah liquibase akan membuat changleog untuk semua database (satu per satu) atau hanya 1 changelog untuk semua database?

3. **Kegunaan Liquibase**

   Tuliskan kegunaan dan fungsi dari liquibase beserta contoh penggunannya dari plan 2

4. Saya masih belum paham, coba gunakan database `masterep-annursulsel` untuk mencontohkan kesaya cara penggunaannya

5. Pertanyaan selanjutnya:
   - Jika saya ingin melakukan perubahan/alter tabel apakah melalui liquibase atau langsung ubah di database menggunakan tool semacam navicat?
     *Jawaban*: Harus melalui **Liquibase** (tulis changeset `ALTER TABLE` pada file changelog lalu jalankan `liquibase update`). Jika diubah manual lewat Navicat, perubahan tidak tercatat di Git dan tidak bisa direplikasi otomatis ke staging/production.
   - Jika perubahan sudah dilakukan katakanlah lewat navicat apakah `DATABASECHANGELOG` dan `DATABASECHANGELOGLOCK` akan terisi otomatis
     *Jawaban*: **TIDAK**. Liquibase bukan daemon/trigger di dalam MySQL. Tabel `DATABASECHANGELOG` dan `DATABASECHANGELOGLOCK` hanya diisi ketika perintah CLI Liquibase dijalankan (`update` / `changelog-sync`). Perubahan langsung via Navicat menyebabkan *schema drift* (ketidaksinkronan antara database dan file changelog).

## Goals

- [x] Pelajari dan berikan feedback plan 1
- [x] Cek dan implementasikan plan 2
- [x] Cek dan implementasikan plan 3
- [x] Jelaskan dan praktikkan plan 4 agar saya paham, kalau perlu buatkan dokumen md baru khusus bagian ini
- [x] Jawab dan dokumentasikan plan 5

## Closing

- Selalu update checklist [x] setelah pembenahan selesai
- Tuliskan hasil feedback, fixing beserta file-file mana saja yang diperbarui kedalam folder `/markdown/result/`
- Jika terdapat lebih dari 1 plan dan feedback, tetap tulis pada file sebelumnya, pisahkan dengan per section
