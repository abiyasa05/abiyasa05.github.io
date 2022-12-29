-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 10:35 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `jamsul`
--

CREATE TABLE `jamsul` (
  `id_jamsul` int(5) NOT NULL,
  `jam_penyusulan` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jamsul`
--

INSERT INTO `jamsul` (`id_jamsul`, `jam_penyusulan`) VALUES
(1, '08:00:00'),
(2, '10:00:00'),
(8, '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `panduan`
--

CREATE TABLE `panduan` (
  `kode_buku` int(11) NOT NULL,
  `nama_buku` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  `ekstensi` varchar(100) NOT NULL,
  `berkas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `panduan`
--

INSERT INTO `panduan` (`kode_buku`, `nama_buku`, `title`, `size`, `ekstensi`, `berkas`) VALUES
(2, 'Ziarah Kubur', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf'),
(3, 'Buku Panduan Doa Ziarah Kubur', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf'),
(4, 'Tata Cara Doa Ziarah Kubur', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf'),
(5, 'Doa - Doa Ziarah Kubur Makam Wali', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf'),
(6, 'Dzikir Dan Doa Ziarah Wali', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf'),
(7, 'Risalah Doa Ziarah Wali', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf'),
(8, 'Panduan Doa Ziarah Kubur', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf'),
(9, 'Doa -Doa Ziarah Wali Songo', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf'),
(10, 'Doa Ziarah Kubur', 'ZIARAH KUBUR.pdf', 1035132, 'pdf', '../foto_produk/ZIARAH KUBUR.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `level`) VALUES
('admin@gmail.com', 'd3480f1d0d15567f62fd6797d27ef3d6', 'Admin', '082301101324', 'admin'),
('asd@gmail.com', 'c236f877a6f7070282c4a016aa10a16c', 'asd', '123456', 'user'),
('falendika@gmail.com', '53c34052525d449f41ab15fd2bfcc60c', 'Falendika', '082301329134', 'user'),
('septilutfiana@gmail.com', '66d70e4a65b9cfa95dd68e97f43e7b85', 'Septi Lutfiana', '083114135317', 'user'),
('tegar@gmail.com', '3be365fd2f1773d4a44b65c2260ab81d', 'Tegar', '082301329144', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `bank`, `tanggal`, `bukti`) VALUES
(2, 15, 'mandiri', '2019-10-06', '20191006122838wp3807958-cho-miyeon-wallpapers.jpg'),
(3, 20, 'mandiri', '2019-10-06', '20191006145056Screenshot_2019-07-01-01-36-08.png'),
(4, 24, 'mandiri', '2019-10-08', '20191008030202profil.jpg'),
(5, 25, 'mandiri', '2019-10-08', '20191008032617profil.jpg'),
(6, 27, 'mandiri', '2019-10-08', '20191008041800Screenshot_2019-06-26-02-55-44.png'),
(7, 36, 'mandiri', '2022-06-04', '20220604113902Welcome-Slide-1_720p.jpg'),
(8, 22, 'mandiri', '2022-06-18', '20220618150054Welcome-Slide-1_720p.jpg'),
(9, 39, 'bri', '2022-12-29', '20221229011009BRI GFG.png');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `id_jamsul` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `tgl_penyusulan` date NOT NULL,
  `jam_penyusulan` time NOT NULL,
  `tujuan_awal` varchar(100) NOT NULL,
  `alamat_penyusulan` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `email_pelanggan`, `id_jamsul`, `tanggal_pembelian`, `total_pembelian`, `tgl_penyusulan`, `jam_penyusulan`, `tujuan_awal`, `alamat_penyusulan`, `status_pembelian`, `resi_pengiriman`) VALUES
(15, 'falendika@gmail.com', 1, '2019-10-05', 860000, '0000-00-00', '00:00:00', '', '', 'barang dikirim', 'Anjay'),
(22, 'falendika@gmail.com', 0, '2019-10-08', 400000, '0000-00-00', '00:00:00', '', 'efegeg', 'sudah kirim pembayaran', ''),
(23, 'falendika@gmail.com', 1, '2019-10-08', 410000, '0000-00-00', '00:00:00', '', 'ohwobweo', 'pending', ''),
(26, 'falendika@gmail.com', 2, '2019-10-08', 420000, '0000-00-00', '00:00:00', '', 'klo', 'pending', ''),
(34, 'falendika@gmail.com', 1, '2019-10-20', 860000, '0000-00-00', '00:00:00', '', 'anjay', 'batal', ''),
(36, 'falendika@gmail.com', 1, '2022-06-04', 410000, '0000-00-00', '00:00:00', '', 'Malang', 'barang dikirim', '12345'),
(37, 'falendika@gmail.com', 2, '2022-12-25', 250000, '2022-12-28', '10:00:00', '', 'Jl. Malang', 'pending', ''),
(38, 'falendika@gmail.com', 0, '2022-12-27', 2500000, '0000-00-00', '00:00:00', 'Dinoyo', 'Jl. Malang', 'pending', ''),
(39, 'septilutfiana@gmail.com', 2, '2022-12-29', 18000000, '2022-12-30', '10:00:00', 'Sunan Ampel, Lokasi: Jalan Ampel Masjid Nomor 43, Kelurahan Ampel. Kecamatan Semampir, Surabaya, Jaw', 'Jl. Soekarno Hatta No.9, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur', 'barang dikirim', '123456789'),
(40, 'septilutfiana@gmail.com', 1, '2022-12-29', 4300000, '2023-01-06', '08:00:00', 'Makam Kyai Ageng Gribig, Lokasi:  Madyopuro, Kec. Kedungkandang, Kota Malang, Jawa Timur', 'Jl. Soekarno Hatta No.9, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur', 'pending', ''),
(41, 'septilutfiana@gmail.com', 1, '2022-12-29', 7830000, '2023-01-06', '08:00:00', 'Makam Habib Sholeh Tanggul,  Lokasi:  Krajan, Tanggul Kulon, Kec. Tanggul, Kabupaten Jember, Jawa Ti', 'Jl. Soekarno Hatta No.9, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur', 'pending', '');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
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
-- Dumping data for table `pembelian_produk`
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
(49, 37, 13, 1, 'Paket Bandung', 250000, 250000),
(50, 38, 13, 10, 'Paket Bandung', 250000, 2500000),
(51, 39, 19, 45, 'Paket 9 Wali', 400000, 18000000),
(52, 40, 20, 43, 'Paket Makam Malang', 100000, 4300000),
(53, 41, 15, 54, 'Paket Makam Jember', 145000, 7830000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `rute_perjalanan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `foto_produk`, `deskripsi_produk`, `rute_perjalanan`) VALUES
(13, 'Paket Makam Bandung', 250000, 'PETA BANDUNG.jpg', 'Di Bandung terdapat dua wali yaitu Makam Eyang Dalem Ibrahim Cipatik dan Makam Pangeran Raja Atas Angin', 'Makam Eyang Dalem Ibrahim Cipatik, lokasi: Kompleks Pemakaman Pataruman, Desa Cipatik, Kabupaten Bandung Barat, Jawa Barat, Makam Pangeran Raja Atas Angin, lokasi: Desa Cijenuk, Kecamatan Cipongkor, Kabupaten Bandung Barat, Jawa Barat\r\n'),
(14, 'Paket Makam Jombang', 300000, 'PETA JOMBANG.jpeg', 'Di Jombang terdapat tiga makam wali yaitu Makam KH Abdul Wahab Chasbullah, Makam KH Bisri Syansuri, dan Makam Sayyid Sulaiman', 'Makam KH Abdul Wahab Chasbullah, Lokasi: Desa Tambakrejo, Kecamatan/Kabupaten Jombang.\r\nMakam KH Bisri Syansuri, Lokasi: Pondok Pesantren Mambaul Maarif Denanyar, Kecamatan/Kabupaten Jombang.\r\nMakam Sayyid Sulaiman, Lokasi: Desa Mancilan, Kecamatan Mojoagung, Kabupaten Jombang\r\n'),
(15, 'Paket Makam Jember', 145000, 'PETA JEMBER.jpeg', 'Di Jember terdapat tiga wali yaitu Habib Sholeh Tanggul, Al Habib Aqil Bin Salim Al Atthos, dan Al-Habib Abdullah Bin Umar Bin Syekh Abibakar .', 'Makam Habib Sholeh Tanggul,  Lokasi:  Krajan, Tanggul Kulon, Kec. Tanggul, Kabupaten Jember, Jawa Timur. \r\nMakam Al Habib Aqil Bin Salim Al Atthos, Lokasi: Jl. Hayam Wuruk No.2, Kaliwates Kidul, Kaliwates, Kec. Kaliwates, Kabupaten Jember, Jawa Timur.\r\nMakam Al-Habib Abdullah Bin Umar Bin Syekh Abibakar, Lokasi: Wetan Kali, Balung Lor, Kec. Balung, Kabupaten Jember, Jawa Timur.'),
(16, 'Paket Jawa Timur', 150000, 'jatim.png', 'Dikenal dengan wali limo yakni Sunan Ampel Surabaya, Sunan Giri, Sunan Maulana Malik Ibrahim, Sunan Drajat Lamongan dan Sunan Bonang Tuban.', 'Sunan Ampel, Lokasi: Jalan Ampel Masjid Nomor 43, Kelurahan Ampel. Kecamatan Semampir, Surabaya, Jawa Timur.\r\nSunan Drajat, Lokasi: Desa Drajat, Kecamatan Paciran, Kabupaten Lamongan, Jawa Timur.\r\nSunan Gresik, Lokasi: Jalan Malik Ibrahim Nomor 52-62, Kelurahan Bedilan, Kecamatan Gresik, Kabupaten Gresik, Jawa Timur.\r\nSunan Giri, Lokasi: Jalan Sunan Prapen Nomor 7, Kelurahan Sekarkurung, Kecamatan Kebomas, Kabupaten Gresik, Jawa Timur.\r\nSunan Bonang, Lokasi: Jalan KH Mustain, Kelurahan Kutorejo, Kecamatan Tuban, Kabupaten Tuban, Jawa Timur.'),
(17, 'Paket Jawa Tengah', 175000, 'JATENG.png', 'Dikenal dengan wali telu yakni Sunan Muria Japan , Sunan Kudus Kudus Jawa Tengah, dan Sunan Kalijaga Demak.', 'Sunan Muria, Lokasi: Jl. Makam Sunan Muria Japan, Kec. Dawe, Kabupaten Kudus, Jawa Tengah.\r\nSunan Kudus, Lokasi: Gg. Kauman, Pejaten, Kauman, Kec. Kota Kudus, Kabupaten Kudus, Jawa Tengah.\r\nSunan Kalijaga, Lokasi: Jl. Raden Sahid, Kadilangu, Kec. Demak, Kabupaten Demak, Jawa Tengah.\r\n'),
(18, 'Paket Jawa Barat', 200000, 'jabar.png', 'Di Jawa Barat terdapat satu wali yaitu Sunan Gunung Jati yang terletak di Cirebon Jawa Barat.', 'Sunan Gunung Jati, Lokasi: Jl. Alun-Alun Ciledug No.53, Astana, Kec. Gunungjati, Kabupaten Cirebon, Jawa Barat.'),
(19, 'Paket 9 Wali', 400000, 'WALI 9.jpg', 'Sunan Ampel Surabaya, Sunan Giri, Sunan Maulana Malik Ibrahim, Sunan Drajat Lamongan, Sunan Bonang Tuban,  Sunan Muria Kudus , Sunan Kudus Kudus Jawa Tengah, Sunan Kalijaga Demak, Sunan Gunung Jati yang terletak di Cirebon Jawa Barat.', 'Sunan Ampel, Lokasi: Jalan Ampel Masjid Nomor 43, Kelurahan Ampel. Kecamatan Semampir, Surabaya, Jawa Timur.\r\nSunan Drajat, Lokasi: Desa Drajat, Kecamatan Paciran, Kabupaten Lamongan, Jawa Timur.\r\nSunan Gresik, Lokasi: Jalan Malik Ibrahim Nomor 52-62, Kelurahan Bedilan, Kecamatan Gresik, Kabupaten Gresik, Jawa Timur.\r\nSunan Giri, Lokasi: Jalan Sunan Prapen Nomor 7, Kelurahan Sekarkurung, Kecamatan Kebomas, Kabupaten Gresik, Jawa Timur.\r\nSunan Bonang, Lokasi: Jalan KH Mustain, Kelurahan Kutorejo, Kecamatan Tuban, Kabupaten Tuban, Jawa Timur.\r\nSunan Muria, Lokasi: Jl. Makam Sunan Muria Japan, Kec. Dawe, Kabupaten Kudus, Jawa Tengah.\r\nSunan Kudus, Lokasi: Gg. Kauman, Pejaten, Kauman, Kec. Kota Kudus, Kabupaten Kudus, Jawa Tengah.\r\nSunan Kalijaga, Lokasi: Jl. Raden Sahid, Kadilangu, Kec. Demak, Kabupaten Demak, Jawa Tengah.\r\nSunan Gunung Jati, Lokasi: Jl. Alun-Alun Ciledug No.53, Astana, Kec. Gunungjati, Kabupaten Cirebon, Jawa Barat\r\n\r\n'),
(20, 'Paket Makam Malang', 100000, 'PETA MALANG.jpeg', 'Terdiri dari 4 makam wali yaitu Makam Kyai Ageng Gribig, Makam Mbah Ageng Sembeodjo, Makam Mbah Patok Galih, Makam Mbah Honggo.', 'Makam Kyai Ageng Gribig, Lokasi:  Madyopuro, Kec. Kedungkandang, Kota Malang, Jawa Timur.\r\nMakam Mbah Ageng Sembeodjo, Lokasi: Madyopuro, Kec. Kedungkandang, Kota Malang, Jawa Timur.\r\nMakam Mbah Patok Galih, Lokasi: Jl. Raya Songgoriti No.18, Songgokerto, Kec. Batu, Kota Batu, Jawa Timur.\r\nMakam Mbah Honggo, Lokasi: jalan Jenderal Bauki Rahmat Gg. 4, Kauman, Kec. Klojen, Kota Malang.'),
(21, 'Paket Makam Ponorogo', 125000, 'PETA PONOROGO.jpeg', 'Terdiri dari 3 makam wali yaitu Makam  Kyai Ageng Hasan Besari, Makam Bathoro Khatong, Makam Astana Srandil.', 'Makam  Kyai Ageng Hasan Besari, Lokasi: Dusun Jinontro, Desa Tegalsari, Kec. Jetis, Kabupaten Ponorogo, Jawa Timur.\r\nMakam Bathoro Khatong, Lokasi: Dusun Plampitan, Desa Setono, Kec. Jenangan, Kabupaten Ponorogo, Jawa Timur.\r\nMakam Astana Srandil, Lokasi: Jl. Astana, Srandil, Kec. Jambon, Kabupaten Ponorogo, Jawa Timur.'),
(22, 'Paket Makam Pasuruan', 150000, 'PETA PASURUAN.jpeg', 'Terdapat 5 Makam wali yaitu Makam K.H Abdul Hamid, Makam Mbah Segoropuro, Makam Mbah Ratu Ayu, Makam Mbah Slagah, Makam Mbah Semendi.', 'Makam K.H Abdul Hamid, Lokasi: Kompleks pemakaman Masjid Jamik Al-Anwar, Pasuruan.\r\nMakam Mbah Segoropuro, Lokasi: Desa Segoropuro, Kecamatan Rejozo, Pasuruan.\r\nMakam Mbah Ratu Ayu, Lokasi: Kelurahan Kersikan, Kecamatan Bangil, Pasuruan.\r\nMakam Mbah Slagah, Lokasi: Jl. Pahlawan No.24, Pekuncen, Kec. Panggungrejo, Kota Pasuruan.\r\nMakam Mbah Semendi, Lokasi: Jl. Raya Bandaran No.2, Bandaran, Winongan Lor, Kec. Winongan, Pasuruan'),
(23, 'Paket Makam Madura', 135000, 'MADURA.jpeg', 'Di Madura terdapat 2 makam wali yaitu Makam Syaikhona Kholil Bangkalan, dan Makam Raden Abdul Kadirun.', 'Makam Syaikhona Kholil Bangkalan Lokasi: Desa Martajasah, Kabupaten Bangkalan, Madura.\r\nMakam Raden Abdul Kadirun Lokasi: Jalan Sultan Abdul Kadirun, di belakang Masjid Agung Kota Bangkalan, Madura, Jawa Timur.'),
(24, 'Paket Makam Solo', 140000, 'PETA SOLO.jpeg', 'Di Solo terdapat 4 makam wali yaitu Makam Habib Alwi bin Ali Al-Habsyi,\r\nKiai Ageng Henis Laweyan, Makam Kiai Muhammad bin Sulaiman bin Zakariya, dan Makam Kiai Manshur Popongan.', 'Makam Habib Alwi bin Ali Al-Habsyi, Lokasi: Ps. Kliwon, Kec. Ps. Kliwon, Kota Surakarta, Jawa Tengah.\r\nKiai Ageng Henis Laweyan, Lokasi: Pajang, Kec. Laweyan, Kota Surakarta, Jawa Tengah.\r\nMakam Kiai Muhammad bin Sulaiman bin Zakariya, Lokasi: Pemakaman Pulo, Pajang, Laweyan.\r\nMakam Kiai Manshur Popongan Lokasi: Dusun 1, Tegalgondo, Kec. Wonosari, Kabupaten Klaten, Jawa Tengah.'),
(25, 'Paket Makam Semarang', 175000, 'PETA SEMARANG.png', 'Di Semarang terdapat 5 makam wali yaitu Makam Ki Ageng Pandanaran, Makam Ki Ageng Galang Sewu, Makam Kiai Haji Sholeh Darat, Makam Syekh Kramat Jati, Makam Mbah Depok.', 'Makam Ki Ageng Pandanaran, Lokasi: Jalan Mugas, Mugassari, Kecamatan Semarang Selatan, Kota Semarang, Jawa Tengah.\r\nMakam Ki Ageng Galang Sewu, Lokasi: Tembalang, Kota Semarang, Jawa Tengah.\r\nMakam Kiai Haji Sholeh Darat, Lokasi: jalan Bendungan, Randusari, Kecamatan Semarang Selatan, Kota Semarang, Jawa Tengah.\r\nMakam Syekh Kramat Jati, Lokasi: Lamper Kidul, Kecamatan Semarang Selatan, Kota Semarang, Jawa Tengah.\r\nMakam Mbah Depok, Lokasi: Kembangsari, Kecamatan Semarang Tengah, Kota Semarang. Jawa Tengah. \r\n'),
(26, 'Paket Makam Banyuwangi', 110000, 'PETA BANYUWANGI.jpeg', 'Di Banyuwangi terdapat 4 makam wali yaitu Makam Syekh Al Maulaya, Makam Datuk Malik Ibrahim, Makam Buyut Dewi Sayu Atikah, Makam Kiyai Saleh Lateng.', 'Makam Syekh Al Maulaya, Lokasi: Jl. Grajagan, Sawah, Glagahagung, Kec. Purwoharjo, Kabupaten Banyuwangi, Jawa Timur.\r\nMakam Datuk Malik Ibrahim, Lokasi: Lateng, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur.\r\nMakam Buyut Dewi Sayu Atikah, Lokasi: Jl. Letkol Istiqlah No.97, Area Sawah, Mojopanggung, Kec. Giri, Kabupaten Banyuwangi, Jawa Timur.\r\nMakam Kiyai Saleh Lateng, Lokasi: Jl. Riau, Lateng, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur.\r\n'),
(27, 'Paket Makam Jakarta', 500000, 'PETA JAKARTA.jpg', 'Di Jakarta terdapat 4 makam wali yaitu Makam Mbah Priok, Makam habib Ali Kwitang, Makam Habib Ahmad bin Alwi Al Hadad, Makam Habib Ali bin Husein Alatas.', 'Makam Mbah Priok, Lokasi: Jl. Jampea No.6, RW.1, Koja, Kec. Tj. Priok, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta.\r\nMakam habib Ali Kwitang, Lokasi: Jl. Kembang Raya No.6, RT.1/RW.2, Kwitang, Kec. Senen, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta.\r\nMakam Habib Ahmad bin Alwi Al Hadad, Lokasi: Jl. Rawajati Timur II No.69, RW.8, Rawajati, Kec. Pancoran, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta.\r\nMakam Habib Ali bin Husein Alatas, Lokasi: Jl. Raya Condet No.44, RT.2/RW.6, Cililitan, Kec. Kramat jati, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta.'),
(28, 'Paket Makam Kediri', 130000, 'PETA KEDIRI.jpg', 'Di Kediri terdapat 3 makam wali yaitu Makam Mbah Wasil Setono Gedong, Makam Auliya Sunan Geseng, Makam Masyayikh Lirboyo.', 'Makam Mbah Wasil Setono Gedong, Lokasi:Setono Gedong, Kec. Kota, Kota Kediri, Jawa Timur.\r\nMakam Auliya Sunan Geseng, Lokasi: Kp. Dalem, Kec. Kota, Kota Kediri, Jawa Timur.\r\nMakam Masyayikh Lirboyo, Lokasi:Lirboyo, Kec. Mojoroto, Kabupaten Kediri, Jawa Timur.');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `email_pelanggan` varchar(100) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `biodata` text DEFAULT NULL,
  `foto_profil` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`email_pelanggan`, `tanggal_lahir`, `tempat_lahir`, `biodata`, `foto_profil`) VALUES
('falendika@gmail.com', '2003-02-10', 'Jombang', 'Saya hanya manusia biasa :)																																			', 'profil.jpg'),
('tegar@gmail.com', '0000-00-00', '', '', NULL),
('asd@gmail.com', NULL, NULL, NULL, NULL),
('septilutfiana@gmail.com', '2002-03-29', 'Ponorogo', 'Mahasiswa', 'WhatsApp Image 2022-06-18 at 09.30.55.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `umpanbalik`
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
-- Table structure for table `wishlist`
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
-- Indexes for table `jamsul`
--
ALTER TABLE `jamsul`
  ADD PRIMARY KEY (`id_jamsul`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`email_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `umpanbalik`
--
ALTER TABLE `umpanbalik`
  ADD PRIMARY KEY (`id_umpanbalik`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id_wishlist`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jamsul`
--
ALTER TABLE `jamsul`
  MODIFY `id_jamsul` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `umpanbalik`
--
ALTER TABLE `umpanbalik`
  MODIFY `id_umpanbalik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id_wishlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
