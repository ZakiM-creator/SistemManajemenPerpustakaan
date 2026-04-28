-- ===========================================
-- TUGAS 1: EKSPLORASI DATABASE DENGAN QUERY =
-- ===========================================

-- STATISTIK BUKU (5 QUERY)

-- Query 1: Menghitung total seluruh data buku yang ada di tabel
SELECT COUNT(*) AS total_buku
FROM buku;

-- Query 2: Menghitung total nilai inventaris (harga dikali stok setiap buku)
SELECT SUM(harga * stok) AS total_nilai_inventaris
FROM buku;

-- Query 3: Menghitung rata-rata harga dari semua buku
SELECT AVG(harga) AS rata_rata_harga
FROM buku;

-- Query 4: Menampilkan buku dengan harga paling mahal
SELECT judul, harga
FROM buku
ORDER BY harga DESC
LIMIT 1;

-- Query 5: Menampilkan buku dengan jumlah stok terbanyak
SELECT judul, stok
FROM buku
ORDER BY stok DESC
LIMIT 1;

-- ================================
-- FILTER DAN PENCARIAN (5 QUERY) =
-- ================================

-- Query 6: Menampilkan buku kategori Programming dengan harga kurang dari 100.000
SELECT *
FROM buku
WHERE kategori = 'Programming'
  AND harga < 100000;

-- Query 7: Mencari buku yang judulnya mengandung kata PHP atau MySQL
SELECT *
FROM buku
WHERE judul LIKE '%PHP%' OR judul LIKE '%MySQL%';

-- Query 8: Menampilkan buku yang diterbitkan pada tahun 2024
SELECT *
FROM buku
WHERE tahun_terbit = 2024;

-- Query 9: Menampilkan buku dengan stok antara 5 sampai 10
SELECT *
FROM buku
WHERE stok BETWEEN 5 AND 10;

-- Query 10: Menampilkan buku dengan pengarang bernama Budi Raharjo
SELECT *
FROM buku
WHERE pengarang = 'Budi Raharjo';

-- =====================================================
-- GROUPING DAN AGREGASI (3 QUERY)
-- =====================================================

-- Query 11: Mengelompokkan buku berdasarkan kategori dan menghitung jumlah buku serta total stok
SELECT 
    kategori,
    COUNT(*) AS jumlah_buku,
    SUM(stok) AS total_stok
FROM buku
GROUP BY kategori;

-- Query 12: Menghitung rata-rata harga buku untuk setiap kategori
SELECT 
    kategori,
    AVG(harga) AS rata_rata_harga
FROM buku
GROUP BY kategori;

-- Query 13: Menampilkan kategori dengan total nilai inventaris terbesar
SELECT 
    kategori,
    SUM(harga * stok) AS total_nilai_inventaris
FROM buku
GROUP BY kategori
ORDER BY total_nilai_inventaris DESC
LIMIT 1;

-- =====================================================
-- UPDATE DATA (2 QUERY)
-- =====================================================

-- Query 14: Menaikkan harga buku kategori Programming sebesar 5%
UPDATE buku
SET harga = harga * 1.05
WHERE kategori = 'Programming';

-- Query 15: Menambahkan stok sebanyak 10 untuk buku yang stoknya kurang dari 5
UPDATE buku
SET stok = stok + 10
WHERE stok < 5;

-- =====================================================
-- LAPORAN KHUSUS (2 QUERY)
-- =====================================================

-- Query 16: Menampilkan daftar buku yang perlu restock (stok kurang dari 5)
SELECT *
FROM buku
WHERE stok < 5;

-- Query 17: Menampilkan 5 buku dengan harga paling mahal
SELECT judul, harga
FROM buku
ORDER BY harga DESC
LIMIT 5;