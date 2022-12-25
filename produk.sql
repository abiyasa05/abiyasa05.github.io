-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 06:09 AM
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
-- Table structure for table `produk`
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
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(5, 'Paket Jawa Timur', 150000, 'jatim.png', 'Dikenal dengan wali limo yakni Sunan Ampel Surabaya, Sunan Giri, Sunan Maulana Malik Ibrahim, Sunan Drajat Lamongan dan Sunan Bonang Tuban.\r\nRute\r\nSunan Ampel — Lokasi: Jalan Ampel Masjid Nomor 43, Kelurahan Ampel. Kecamatan Semampir, Surabaya, Jawa Timur\r\nSunan Drajat — Lokasi: Desa Drajat, Kecamatan Paciran, Kabupaten Lamongan, Jawa Timur\r\nSunan Gresik — Lokasi: Jalan Malik Ibrahim Nomor 52-62, Kelurahan Bedilan, Kecamatan Gresik, Kabupaten Gresik, Jawa Timur\r\nSunan Giri — Lokasi: Jalan Sunan Prapen Nomor 7, Kelurahan Sekarkurung, Kecamatan Kebomas, Kabupaten Gresik, Jawa Timur\r\nSunan Bonang — Lokasi: Jalan KH Mustain, Kelurahan Kutorejo, Kecamatan Tuban, Kabupaten Tuban, Jawa Timur\r\n', 2000),
(8, 'Paket Jawa Tengah', 175000, 'JATENG.png', 'Dikenal dengan wali telu yakni Sunan Muria Kudus , Sunan Kudus Kudus Jawa Tengah, dan Sunan Kalijaga Demak.\r\n\r\nRute Ziarah\r\nSunan Muria — Lokasi Jl. Makam Sunan Muria Japan, Kec. Dawe, Kabupaten Kudus, Jawa Tengah\r\nSunan Kudus — Lokasi Gg. Kauman, Pejaten, Kauman, Kec. Kota Kudus, Kabupaten Kudus, Jawa Tengah \r\nSunan Kalijaga — Lokasi Jl. Raden Sahid, Kadilangu, Kec. Demak, Kabupaten Demak, Jawa Tengah \r\n', 100),
(9, 'Paket Jawa Barat', 200000, 'jabar.png', 'Di Jawa Barat terdapat satu wali yaitu Sunan Gunung Jati yang terletak di Cirebon Jawa Barat\r\n\r\nRute \r\nSunan Gunung Jati — lokasi Jl. Alun-Alun Ciledug No.53, Astana, Kec. Gunungjati, Kabupaten Cirebon, Jawa Barat\r\n						', 150),
(10, 'Paket 9 Wali', 400000, 'WALI 9.jpg', 'Sunan Ampel Surabaya, Sunan Giri, Sunan Maulana Malik Ibrahim, Sunan Drajat Lamongan, Sunan Bonang Tuban,  Sunan Muria Kudus , Sunan Kudus Kudus Jawa Tengah, Sunan Kalijaga Demak, Sunan Gunung Jati yang terletak di Cirebon Jawa Barat\r\nRute\r\nSunan Ampel — Lokasi: Jalan Ampel Masjid Nomor 43, Kelurahan Ampel. Kecamatan Semampir, Surabaya, Jawa Timur\r\nSunan Drajat — Lokasi: Desa Drajat, Kecamatan Paciran, Kabupaten Lamongan, Jawa Timur\r\nSunan Gresik — Lokasi: Jalan Malik Ibrahim Nomor 52-62, Kelurahan Bedilan, Kecamatan Gresik, Kabupaten Gresik, Jawa Timur\r\nSunan Giri — Lokasi: Jalan Sunan Prapen Nomor 7, Kelurahan Sekarkurung, Kecamatan Kebomas, Kabupaten Gresik, Jawa Timur\r\nSunan Bonang — Lokasi: Jalan KH Mustain, Kelurahan Kutorejo, Kecamatan Tuban, Kabupaten Tuban, Jawa Timur\r\nSunan Muria — Lokasi Jl. Makam Sunan Muria Japan, Kec. Dawe, Kabupaten Kudus, Jawa Tengah\r\nSunan Kudus — Lokasi  Gg. Kauman, Pejaten, Kauman, Kec. Kota Kudus, Kabupaten Kudus, Jawa Tengah \r\nSunan Kalijaga — Lokasi Jl. Raden Sahid, Kadilangu, Kec. Demak, Kabupaten Demak, Jawa Tengah \r\nSunan Gunung Jati — lokasi Jl. Alun-Alun Ciledug No.53, Astana, Kec. Gunungjati, Kabupaten Cirebon, Jawa Barat\r\n', 500),
(13, 'Paket Makam Malang', 100000, 'PETA MALANG.jpeg', 'Terdiri dari 4 makam wali yaitu Makam Kyai Ageng Gribig, Makam Mbah Ageng Sembeodjo, Makam Mbah Patok Galih, Makam Mbah Honggo\r\nRute\r\nMakam Kyai Ageng Gribig — Lokasi  Madyopuro, Kec. Kedungkandang, Kota Malang, Jawa Timur \r\nMakam Mbah Ageng Sembeodjo — Lokasi 2M87+C8Q, Madyopuro, Kec. Kedungkandang, Kota Malang, Jawa Timur \r\nMakam Mbah Patok Galih — Lokasi Jl. Raya Songgoriti No.18, Songgokerto, Kec. Batu, Kota Batu, Jawa Timur\r\nMakam Mbah Honggo — Lokasi jalan Jenderal Bauki Rahmat Gg. 4, Kauman, Kec. Klojen, Kota Malang', 2000),
(14, 'Paket Makam Ponorogo', 125000, 'PETA PONOROGO.jpeg', 'Terdiri dari 3 makam wali yaitu Makam  Kyai Ageng Hasan Besari, Makam Bathoro Khatong, Makam Astana Srandil\r\nRute\r\nMakam  Kyai Ageng Hasan Besari – Lokasi Dusun Jinontro, Desa Tegalsari, Kec. Jetis, Kabupaten Ponorogo, Jawa Timur\r\nMakam Bathoro Khatong — lokasi Dusun Plampitan, Desa Setono, Kec. Jenangan, Kabupaten Ponorogo, Jawa Timur\r\nMakam Astana Srandil  — Lokasi Jl. Astana, Srandil, Kec. Jambon, Kabupaten Ponorogo, Jawa Timur', 300),
(15, 'Paket Makam Pasuruan', 150000, 'PETA PASURUAN.jpeg', 'Rute\r\nMakam K.H Abdul Hamid — Lokasi Kompleks pemakaman Masjid Jamik Al-Anwar, Pasuruan.\r\nMakam Mbah Segoropuro — Lokasi  Desa Segoropuro, Kecamatan Rejozo, Pasuruan.\r\nMakam Mbah Ratu Ayu —  Lokasi Kelurahan Kersikan, Kecamatan Bangil, Pasuruan.\r\nMakam Mbah Slagah — Lokasi Jl. Pahlawan No.24, Pekuncen, Kec. Panggungrejo, Kota Pasuruan.\r\nMakam Mbah Semendi – Lokasi Jl. Raya Bandaran No.2, Bandaran, Winongan Lor, Kec. Winongan, Pasuruan', 200),
(16, 'Paket Makam Jombang', 125000, 'PETA JOMBANG.jpeg', 'Rute\r\nMakam KH Abdul Wahab Chasbullah –  Lokasi Desa Tambakrejo, Kecamatan/Kabupaten Jombang.\r\nMakam KH Bisri Syansuri — Lokasi Pondok Pesantren Mambaul Maarif Denanyar, Kecamatan/Kabupaten Jombang.\r\nMakam Sayyid Sulaiman — Lokasi Desa Mancilan, Kecamatan Mojoagung, Kabupaten Jombang\r\nKH Tamim Irsyad dan KH Romli Tamim  — Lokasi Makam Pondok Pesantren Darul Ulum, Rejoso, Kecamatan Peterongan, Kabupaten Jombang.', 200),
(17, 'Paket Makam Madura', 135000, 'MADURA.jpeg', 'Rute\r\nMakam Syaikhona Kholil Bangkalan Lokasi: Desa Martajasah, Kabupaten Bangkalan, Madura.\r\nMakam Raden Abdul Kadirun Lokasi: Jalan Sultan Abdul Kadirun, di belakang Masjid Agung Kota Bangkalan, Madura, Jawa Timur.', 100),
(18, 'Paket Makam Solo', 140000, 'PETA SOLO.jpeg', 'Rute\r\nmakam Habib Alwi bin Ali Al-Habsyi, lokasi Ps. Kliwon, Kec. Ps. Kliwon, Kota Surakarta, Jawa Tengah\r\nKiai Ageng Henis Laweyan, lokasi Pajang, Kec. Laweyan, Kota Surakarta, Jawa Tengah\r\nMakam Kiai Muhammad bin Sulaiman bin Zakariya, Lokasi Lokasi Pemakaman Pulo, Pajang, Laweyan\r\nMakam Kiai Manshur Popongan Lokasi Dusun 1, Tegalgondo, Kec. Wonosari, Kabupaten Klaten, Jawa Tengah\r\nMakam KH. Idris Jamsaren dan KH. Ahmad Siroj Lokasi Dusun II, Makamhaji, Kec. Kartasura, Kabupaten Sukoharjo, Jawa Tengah', 300),
(19, 'Paket Makam Semarang', 175000, 'PETA SEMARANG.png', 'Rp. 175.000,00\r\nRute \r\nMakam Ki Ageng Pandanaran, Lokasi  Jalan Mugas, Mugassari, Kecamatan Semarang Selatan, Kota Semarang, Jawa Tengah\r\nMakam Ki Ageng Galang Sewu, Lokasi Tembalang, Kota Semarang, Jawa Tengah.\r\nMakam Kiai Haji Sholeh Darat, Lokasi alan Bendungan, Randusari, Kecamatan Semarang Selatan, Kota Semarang, Jawa Tengah.\r\nMakam Syekh Kramat Jati, Lokasi  Lamper Kidul, Kecamatan Semarang Selatan, Kota Semarang, Jawa Tengah\r\nMakam Mbah Depok, Lokasi  Kembangsari, Kecamatan Semarang Tengah, Kota Semarang. Jawa Tengah. ', 200),
(20, 'Paket Makam Banyuwangi', 110000, 'PETA BANYUWANGI.jpeg', 'Rute\r\nMakam Syekh Al Maulaya, Lokasi  Jl. Grajagan, Sawah, Glagahagung, Kec. Purwoharjo, Kabupaten Banyuwangi, Jawa Timur \r\nMakam Datuk Malik Ibrahim, Lokasi, Lateng, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur \r\nMakam Buyut Dewi Sayu Atikah, Lokasi, Jl. Letkol Istiqlah No.97, Area Sawah, Mojopanggung, Kec. Giri, Kabupaten Banyuwangi, Jawa Timur\r\nMakam Kiyai Saleh Lateng, Lokasi Jl. Riau, Lateng, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur', 200),
(21, 'Paket Makam Kediri', 13000, 'PETA KEDIRI.jpg', 'Rute\r\nMakam Mbah Wasil Setono Gedong Lokasi Setono Gedong, Kec. Kota, Kota Kediri, Jawa Timur \r\nMakam Auliya Sunan Geseng Lokasi Kp. Dalem, Kec. Kota, Kota Kediri, Jawa Timur\r\nMakam Masyayikh Lirboyo Lokasi Lirboyo, Kec. Mojoroto, Kabupaten Kediri, Jawa Timur ', 400),
(22, 'Paket Makam Bandung', 300000, 'PETA BANDUNG.jpg', 'Makam Eyang Dalem Ibrahim Cipatik, lokasi Kompleks Pemakaman Pataruman, Desa Cipatik, Kabupaten Bandung Barat, Jawa Barat\r\nMakam Pangeran Raja Atas Angin lokasi Desa Cijenuk, Kecamatan Cipongkor, Kabupaten Bandung Barat, Jawa Barat', 200),
(23, 'Paket Makam Jakarta', 500000, 'PETA JAKARTA.jpg', 'Rute\r\nMakam Mbah Priok Lokasi Jl. Jampea No.6, RW.1, Koja, Kec. Tj. Priok, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta \r\nMakam habib Ali Kwitang Lokasi Jl. Kembang Raya No.6, RT.1/RW.2, Kwitang, Kec. Senen, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta \r\nMakam Habib Ahmad bin Alwi Al Hadad Lokasi Jl. Rawajati Timur II No.69, RW.8, Rawajati, Kec. Pancoran, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta\r\nMakam Habib Ali bin Husein Alatas Lokasi, Jl. Raya Condet No.44, RT.2/RW.6, Cililitan, Kec. Kramat jati, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta ', 300),
(24, 'Paket Makam Jember', 145000, 'PETA JEMBER.jpeg', 'Makam Habib Sholeh Tanggul  – lokasi  Krajan, Tanggul Kulon, Kec. Tanggul, Kabupaten Jember, Jawa Timur\r\n', 200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
