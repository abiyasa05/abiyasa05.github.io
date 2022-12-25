-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Des 2022 pada 10.48
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jamsul`
--

CREATE TABLE `jamsul` (
  `id_jamsul` int(5) NOT NULL,
  `jam_penyusulan` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jamsul`
--

INSERT INTO `jamsul` (`id_jamsul`, `jam_penyusulan`) VALUES
(1, '08:00:00'),
(2, '10:00:00'),
(8, '12:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `level`) VALUES
('admin@gmail.com', 'd3480f1d0d15567f62fd6797d27ef3d6', 'Admin', '082301101324', 'admin'),
('asd@gmail.com', 'c236f877a6f7070282c4a016aa10a16c', 'asd', '123456', 'user'),
('falendika@gmail.com', '53c34052525d449f41ab15fd2bfcc60c', 'Falendika', '082301329134', 'user'),
('tegar@gmail.com', '3be365fd2f1773d4a44b65c2260ab81d', 'Tegar', '082301329144', 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `bank`, `tanggal`, `bukti`) VALUES
(2, 15, 'mandiri', '2019-10-06', '20191006122838wp3807958-cho-miyeon-wallpapers.jpg'),
(3, 20, 'mandiri', '2019-10-06', '20191006145056Screenshot_2019-07-01-01-36-08.png'),
(4, 24, 'mandiri', '2019-10-08', '20191008030202profil.jpg'),
(5, 25, 'mandiri', '2019-10-08', '20191008032617profil.jpg'),
(6, 27, 'mandiri', '2019-10-08', '20191008041800Screenshot_2019-06-26-02-55-44.png'),
(7, 36, 'mandiri', '2022-06-04', '20220604113902Welcome-Slide-1_720p.jpg'),
(8, 22, 'mandiri', '2022-06-18', '20220618150054Welcome-Slide-1_720p.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `id_jamsul` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `tgl_penyusulan` date NOT NULL,
  `jam_penyusulan` time NOT NULL,
  `alamat_penyusulan` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `email_pelanggan`, `id_jamsul`, `tanggal_pembelian`, `total_pembelian`, `tgl_penyusulan`, `jam_penyusulan`, `alamat_penyusulan`, `status_pembelian`, `resi_pengiriman`) VALUES
(15, 'falendika@gmail.com', 1, '2019-10-05', 860000, '0000-00-00', '00:00:00', '', 'barang dikirim', 'Anjay'),
(22, 'falendika@gmail.com', 0, '2019-10-08', 400000, '0000-00-00', '00:00:00', 'efegeg', 'sudah kirim pembayaran', ''),
(23, 'falendika@gmail.com', 1, '2019-10-08', 410000, '0000-00-00', '00:00:00', 'ohwobweo', 'pending', ''),
(26, 'falendika@gmail.com', 2, '2019-10-08', 420000, '0000-00-00', '00:00:00', 'klo', 'pending', ''),
(34, 'falendika@gmail.com', 1, '2019-10-20', 860000, '0000-00-00', '00:00:00', 'anjay', 'batal', ''),
(36, 'falendika@gmail.com', 1, '2022-06-04', 410000, '0000-00-00', '00:00:00', 'Malang', 'barang dikirim', '12345'),
(37, 'falendika@gmail.com', 2, '2022-12-25', 250000, '2022-12-28', '10:00:00', 'Jl. Malang', 'pending', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `subharga`) VALUES
(18, 15, 5, 1, 'PS4 Titanfall 2', 400000, 400000),
(19, 15, 8, 1, 'PS4 Watch Dogs 2', 450000, 450000),
(27, 22, 5, 1, 'PS4 Titanfall 2', 400000, 400000),
(28, 23, 5, 1, 'PS4 Titanfall 2', 400000, 400000),
(31, 26, 5, 1, 'PS4 Titanfall 2', 400000, 400000),
(44, 34, 5, 1, 'PS4 Titanfall 2', 400000, 400000),
(45, 34, 8, 1, 'PS4 Watch Dogs 2', 450000, 450000),
(48, 36, 5, 1, 'PS4 Titanfall 2', 400000, 400000),
(49, 37, 13, 1, 'Paket Bandung', 250000, 250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(13, 'Paket Bandung', 250000, 'PETA BANDUNG.jpg', 'Di Jawa Barat terdapat satu wali yaitu Sunan Gunung Jati yang terletak di Cirebon Jawa Barat.', 29),
(14, 'Paket Jombang', 300000, 'PETA JOMBANG.jpeg', 'Di Jawa Barat terdapat satu wali yaitu Sunan Gunung Jati yang terletak di Cirebon Jawa Barat', 20),
(15, 'Paket Jember', 400000, 'PETA JEMBER.jpeg', 'Di Jawa Barat terdapat satu wali yaitu Sunan Gunung Jati yang terletak di Cirebon Jawa Barat', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil`
--

CREATE TABLE `profil` (
  `email_pelanggan` varchar(100) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `biodata` text DEFAULT NULL,
  `foto_profil` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `profil`
--

INSERT INTO `profil` (`email_pelanggan`, `tanggal_lahir`, `tempat_lahir`, `biodata`, `foto_profil`) VALUES
('falendika@gmail.com', '2003-02-10', 'Jombang', 'Saya hanya manusia biasa :)																																			', 'profil.jpg'),
('tegar@gmail.com', '0000-00-00', '', '', NULL),
('asd@gmail.com', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `umpanbalik`
--

CREATE TABLE `umpanbalik` (
  `id_umpanbalik` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `ekspresi` varchar(25) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist`
--

CREATE TABLE `wishlist` (
  `id_wishlist` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jamsul`
--
ALTER TABLE `jamsul`
  ADD PRIMARY KEY (`id_jamsul`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`email_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `umpanbalik`
--
ALTER TABLE `umpanbalik`
  ADD PRIMARY KEY (`id_umpanbalik`);

--
-- Indeks untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id_wishlist`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jamsul`
--
ALTER TABLE `jamsul`
  MODIFY `id_jamsul` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `umpanbalik`
--
ALTER TABLE `umpanbalik`
  MODIFY `id_umpanbalik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id_wishlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
