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
     _Jawaban_: Harus melalui **Liquibase** (tulis changeset `ALTER TABLE` pada file changelog lalu jalankan `liquibase update`). Jika diubah manual lewat Navicat, perubahan tidak tercatat di Git dan tidak bisa direplikasi otomatis ke staging/production.
   - Jika perubahan sudah dilakukan katakanlah lewat navicat apakah `DATABASECHANGELOG` dan `DATABASECHANGELOGLOCK` akan terisi otomatis
     _Jawaban_: **TIDAK**. Liquibase bukan daemon/trigger di dalam MySQL. Tabel `DATABASECHANGELOG` dan `DATABASECHANGELOGLOCK` hanya diisi ketika perintah CLI Liquibase dijalankan (`update` / `changelog-sync`). Perubahan langsung via Navicat menyebabkan _schema drift_ (ketidaksinkronan antara database dan file changelog).

6. Saya punya kasus seperti berikut, saya punya database `masterep_darish` anggaplah ini sebagai database master/rujukan, pada database `masterep-annursulsel` sebagian tabel tidak ada/ tidak lengkap. Apakah bisa `masterep-annursulsel` struktur tabelnya sama dengan `masterep_darish`?
   *Jawaban*: **SANGAT BISA**. Liquibase menyediakan fitur native bernama **`diff-changelog`** yang secara otomatis membandingkan database referensi (`masterep_darish`) dengan database target (`masterep-annursulsel`), lalu menghasilkan file changelog yang berisi perbedaan (tabel/kolom yang kurang) untuk disamakan.

## Goals

- [x] Pelajari dan berikan feedback plan 1
- [x] Cek dan implementasikan plan 2
- [x] Cek dan implementasikan plan 3
- [x] Jelaskan dan praktikkan plan 4 agar saya paham, kalau perlu buatkan dokumen md baru khusus bagian ini
- [x] Jawab dan dokumentasikan plan 5
- [x] Jawab dan praktikkan plan 6 (Sinkronisasi struktur antar database)

## Closing

- Selalu update checklist [x] setelah pembenahan selesai
- Tuliskan hasil feedback, fixing beserta file-file mana saja yang diperbarui kedalam folder `/markdown/result/`
- Jika terdapat lebih dari 1 plan dan feedback, tetap tulis pada file sebelumnya, pisahkan dengan per section
