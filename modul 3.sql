-- Nama : Baiq Sifa Zahratun Zanah
-- Nim : 22241082
-- Modul 3

-- menggunakan database
use mart_undikma;


-- ORDER BY

-- mengambil nama perodak dan qty urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty;

-- mengambvil nama produk dan qty dan qty urutkan berdasarkan qty diikuti dengan nama_produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty, nama_produk;

-- menampilkan semua kolom dari tabel tr_penjualan_diqlab dengan mengurtkan berdasarkan qty dan tgl_transaksi
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC;

-- mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil, nama produk kecil ke besar
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty DESC, nama_produk ASC;

-- menampilkan semua tr_penjualan
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty ASC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- menggunakan hasil perhuitungan padas ORDER BY
-- mengambil nama_produk, qty , harga, dan total bayar urutkan berdasarkan total bayar besar ke kecil
SELECT nama_produk, qty, harga, qty*harga AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY total_bayar DESC;

-- menggunakan Hasil perhitungan pada ORDER BY
SELECT nama_produk, qty, harga, 
diskon_persen, (diskon_persen/100)* harga AS diskon,
qty*(harga - (diskon_persen/100)) AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY total_bayar DESC;

-- WHERE DAN ORDER BY
-- mengambil nama produk, dan qty dari produk berawalan f urut berdasarkan qty besar ke kecil
SELECT nama_produk, qty 
FROM tr_penjualan_dqlab
WHERE nama_produk LIKE 'F%'
ORDER BY qty DESC;

-- menggunakan hasil WHERE dan ORDER BY
SELECT  * FROM tr_penjualan_dqlab WHERE diskon_persen  '0'
ORDER BY qty DESC;

-- FUNGSI AGERGASI
-- Hitung jumlah qty dari seluruh row di tabel penjualan
SELECT sum(qty) AS total_qty FROM tr_penjualan_dqlab;

-- hitung jumlah seluruh row pada tabel penjualan
SELECT count(*) AS jumlah_row FROM tr_penjualan_dqlab;

-- hitung penjumlahan nilai qty dan jumlah seluruh row pada tabel penjualan
SELECT sum(qty), count(*) FROM tr_penjualan_dqlab;

-- hitung rata-rata nilai MAX, dan nilai min dari qty pada tabel penjualan
SELECT avg(qty), max(qty), min(qty) FROM tr_penjualan_dqlab;

-- hitung jumlahg nilai unik dari nama produk di tabel penjualan 
SELECT count(distinct nama_produk) FROM tr_penjualan_dqlab;

SELECT count(nama_produk) FROM tr_penjualan_dqlab;

-- hitung jumlah nilai unik dan seluruh row dari tabel penjualan
SELECT count(*), count(distinct nama_produk) FROM tr_penjualan_dqlab;

-- menampilkan field nama_produk dan fungsi maksimum qty dari tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab;

-- GRUP BY
-- ambil hasil pengelompokan nilai kolom nama produk di tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab GROUP BY  nama_produk;

SELECT nama_produk FROM tr_penjualan_dqlab;

-- ambil hasil pengelompokan dari nama produk dan qty di tabel penjualan 
SELECT nama_produk, qty FROM tr_penjualan_dqlab GROUP BY  nama_produk, qty;

-- ambil hasil penjumlahan qty dari pengelompokan nama produk terhadp semua row di tabel penjualan
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk ORDER BY sum(qty) DESC;

-- HAVING 
--  ambil jumlah qty > 2 dari hasil pengelompokan nama produk di tabel penjualan
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) >2;

-- LATIHAN MANDIRI
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) >4;
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) = 9;
SELECT nama_produk, qty*(harga - (diskon_persen/100)) AS total_bayar FROM tr_penjualan_dqlab GROUP BY nama_produk ORDER BY total_bayar DESC;