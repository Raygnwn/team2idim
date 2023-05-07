-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2023 at 12:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dim`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `IdBarang` int(11) NOT NULL,
  `NamaBarang` varchar(50) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `IdPengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`IdBarang`, `NamaBarang`, `Keterangan`, `satuan`, `IdPengguna`) VALUES
(12, 'Pensil Mekanin', 'Pensil Merk Joyko 0.2mm', 'Pcs', 1),
(13, 'Nike Air Force 1', 'Sepatu Nike Ukuran 42 Warna Putih ', 'Pcs', 1),
(14, 'Tas Kanken', 'Fjalraven Kanken', 'Pcs', 1),
(15, 'Biskuit Marie', 'Biskuit Dari Khong Guan', 'Pcs', 2),
(16, 'Permen Kopiko', 'Per Bungkus isi 20 ', 'Pcs', 2),
(17, 'Bando Kelinci', 'Merk H&M Ukuran L', 'Pcs', 3),
(18, 'Baju Polo', 'Warna Hitam', 'Pcs', 4),
(19, 'Celana Jeans ', 'Levis 501 Ukuran 32', 'Pcs', 4),
(21, 'Kacamata Owl ', 'Bulat', 'Pcs', 5);

-- --------------------------------------------------------

--
-- Table structure for table `hakakses`
--

CREATE TABLE `hakakses` (
  `IdAkses` int(11) NOT NULL,
  `NamaAkses` varchar(30) NOT NULL,
  `Keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hakakses`
--

INSERT INTO `hakakses` (`IdAkses`, `NamaAkses`, `Keterangan`) VALUES
(1, 'Super Admin', 'Super Admin dapat melakukan CRUD terhadap seluruh '),
(2, 'Admin', 'Admin dapat melakukan  CRUD tetapi memiliki batasa'),
(3, 'Pembeli', 'Pembeli dapat melakukan pembelian dan pembayaran t'),
(4, 'Penjual', 'Penjual dapat melakukan penjualan seperti upload b'),
(5, 'Admin gudang', 'Memonitoring keluar masuk barang di Gudang'),
(6, 'Manager', 'Mengawasi kegiatan penjualan, mengelola stok, dan '),
(7, 'Customer service', 'Memberikan layanan kepada pelanggan dan mengelola '),
(8, 'Supervisor', 'Mengawasi kegiatan penjualan dan stok barang'),
(9, 'Kasir', 'Melakukan transaksi penjualan dan mengatur pembaya'),
(10, 'Telemarketing', 'Memberikan layanan kepada pelanggan melalui telepo');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nomor_telepon` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `kode_pos` varchar(100) NOT NULL,
  `IdBarang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `nomor_telepon`, `email`, `kode_pos`, `IdBarang`) VALUES
(1, 'John Doe', 'Jl. Merdeka No. 12', '081234567890', 'johndoe@email.com', '12345', 1),
(2, 'Jane Smith', 'Jl. Sudirman No. 5', '087654321098', 'janesmith@email.com', '67890', 3),
(3, 'Ahmad Rizki', 'Jl. Pahlawan No. 10', '085432187654', 'ahmadrizki@email.com', '54321', 2),
(4, 'Siti Nurul', 'Jl. Diponegoro No. 15', '081234567890', 'sitinurul@email.com', '23456', 5),
(5, 'Budi Santoso', 'Jl. Gajah Mada No. 20', '087654321098', 'budisantoso@email.com', '78901', 7),
(6, 'Rina Amelia', 'Jl. Kartini No. 25', '085432187654', 'rinaamelia@email.com', '43210', 9),
(7, 'Eko Prasetyo', 'Jl. Cempaka No. 30', '081234567890', 'ekoprasetyo@email.com', '87654', 8),
(8, 'Ayu Kusuma', 'Jl. A. Yani No. 35', '087654321098', 'ayukusuma@email.com', '21098', 10),
(9, 'Hendra Saputra', 'Jl. Ahmad Dahlan No. 40', '085432187654', 'hendrasaputra@email.com', '76543', 1),
(10, 'Sari Indah', 'Jl. Pahlawan No. 45', '081234567890', 'sariindah@email.com', '09876', 4),
(11, 'Denny Wijaya', 'Jl. Sudirman No. 50', '087654321098', 'dennywijaya@email.com', '65432', 2),
(12, 'Wulan Sari', 'Jl. Merdeka No. 55', '085432187654', 'wulansari@email.com', '21098', 7),
(13, 'Andi Susanto', 'Jl. Diponegoro No. 60', '081234567890', 'andisusanto@email.com', '76543', 1),
(14, 'Dian Purnama', 'Jl. Gajah Mada No. 65', '087654321098', 'dianpurnama@email.com', '43210', 5),
(15, 'Rita Wijaya', 'Jl. Pahlawan No. 70', '085432187654', 'ritawijaya@email.com', '78901', 3),
(16, 'Dewi Cahyani', 'Jl. Kartini No. 75', '081234567890', 'dewicahyani@email.com', '23456', 2),
(17, 'Fajar Nugroho', 'Jl. Ahmad Dahlan No. 80', '087654321098', 'fajarnugroho@email.com', '87654', 4),
(18, 'Lia Ayu', 'Jl. Palem', '08521827121', 'liaayu@gmail.com', '22112', 3),
(19, 'Aresha', 'Jl. Patimura', '081315477812', 'areshacantik@email.com', '09000', 5),
(20, 'Indah', 'Jl. Muaro jamb', '0852111560547', 'dedeindah@gmail.com', '2221', 6);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `IdPembelian` int(11) NOT NULL,
  `JumlahPembelian` int(11) NOT NULL,
  `HargaBeli` int(11) NOT NULL,
  `IdBarang` int(11) DEFAULT NULL,
  `IdPengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`IdPembelian`, `JumlahPembelian`, `HargaBeli`, `IdBarang`, `IdPengguna`) VALUES
(1, 5, 10000, 12, 1),
(2, 1, 100000, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `IdPengguna` int(11) NOT NULL,
  `NamaPengguna` varchar(50) NOT NULL,
  `PASSWORD` char(128) NOT NULL,
  `NamaDepan` varchar(25) NOT NULL,
  `NamaBelakang` varchar(25) DEFAULT NULL,
  `NoHp` varchar(12) NOT NULL,
  `alamat` text NOT NULL,
  `IdAkses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`IdPengguna`, `NamaPengguna`, `PASSWORD`, `NamaDepan`, `NamaBelakang`, `NoHp`, `alamat`, `IdAkses`) VALUES
(1, 'dheaama', 'password', 'Dhea', 'Amalia', '08123456543', 'Jl. Kenangan 12', 1),
(2, 'gugun', 'password', 'Ray Gunawan', 'Hidayatullah', '08456783453', 'Jl. Semangka 21', 2),
(3, 'rada', 'password', 'Radatunazriah', 'Radatunazriah', '08134566545', 'Jl. Jeruk 11', 2),
(4, 'ezra', 'password', 'Ezra', 'Neviyana', '08123454323', 'Jl. Bebek Kwek Kwek 4', 3),
(5, 'danis', 'password', 'Danis', 'Andika', '08745675345', 'Jl Gozadera 12', 4),
(6, 'dindadibols', 'dindacantik', 'Dinda ', 'Dewi', '081234567543', 'Jl. Nin Aja Doeloe 99', 5),
(7, 'nandeversity', 'aliacantikbegete', 'Nanda', 'Devalia', '083455675676', 'Jl Bunga Matahari 12', 6),
(8, 'dheamoy', 'moymoymoy', 'Ama', 'Moy', '081234565456', 'Jl Hoy Hoy 4', 7),
(9, 'itsarsarsar', 'itsarberani', 'Muhammad', 'Itsar', '081234566564', 'Jl Yang Lurus 17', 8),
(10, 'rizkifamilu', 'sepedafamili', 'Rizki', 'Familu', '081238765456', 'Jl Kebaikan 212', 9),
(11, 'annisaff', 'annisacapcin', 'Annisa', 'Fitria', '081234565678', 'Jl Nin Dengan Indah 99', 5);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `IdPenjualan` int(11) NOT NULL,
  `JumlahPenjualan` int(11) NOT NULL,
  `HargaJual` int(11) NOT NULL,
  `IdBarang` int(11) DEFAULT NULL,
  `IdPengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`IdPenjualan`, `JumlahPenjualan`, `HargaJual`, `IdBarang`, `IdPengguna`) VALUES
(1, 5, 50000, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` varchar(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kode_pos` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `IdPembelian` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama`, `alamat`, `kode_pos`, `kota`, `IdPembelian`) VALUES
('S001', 'PT. ABC', 'Jl. Sudirman No. 123', '12345', 'Jakarta', 2),
('S002', 'CV. XYZ', 'Jl. Gajah Mada No. 456', '54321', 'Surabaya', 1),
('S003', 'UD. KLM', 'Jl. Diponegoro No. 789', '67890', 'Bandung', 3),
('S004', 'PT. DEF', 'Jl. Thamrin No. 456', '54321', 'Jakarta', 4),
('S005', 'CV. UVW', 'Jl. Pemuda No. 123', '12345', 'Surabaya', 5),
('S006', 'UD. NOP', 'Jl. Merdeka No. 789', '67890', 'Bandung', 6),
('S007', 'PT. GHI', 'Jl. Gatot Subroto No. 456', '54321', 'Jakarta', 7),
('S008', 'CV. RST', 'Jl. Hayam Wuruk No. 123', '12345', 'Surabaya', 8),
('S009', 'UD. JKL', 'Jl. Asia Afrika No. 789', '67890', 'Bandung', 9),
('S010', 'PT. MNO', 'Jl. MH Thamrin No. 456', '54321', 'Jakarta', 10),
('S011', 'CV. PQR', 'Jl. Tunjungan No. 123', '12345', 'Surabaya', 2),
('S012', 'UD. STU', 'Jl. Braga No. 789', '67890', 'Bandung', 11),
('S013', 'PT. VWX', 'Jl. Sudirman No. 456', '54321', 'Jakarta', 12),
('S014', 'CV. YZA', 'Jl. Diponegoro No. 123', '12345', 'Surabaya', 4),
('S015', 'UD. BCD', 'Jl. Asia Afrika No. 789', '67890', 'Bandung', 5),
('S016', 'PT. EFG', 'Jl. Thamrin No. 456', '54321', 'Jakarta', 7),
('S017', 'CV. HIJ', 'Jl. Hayam Wuruk No. 123', '12345', 'Surabaya', 8),
('S018', 'UD. KLM', 'Jl. Merdeka No. 789', '67890', 'Bandung', 9),
('S019', 'PT. NOP', 'Jl. Gatot Subroto No. 456', '54321', 'Jakarta', 10),
('S020', 'CV. QRST', 'Jl. Tunjungan No. 123', '12345', 'Surabaya', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`IdBarang`),
  ADD KEY `IdPengguna` (`IdPengguna`);

--
-- Indexes for table `hakakses`
--
ALTER TABLE `hakakses`
  ADD PRIMARY KEY (`IdAkses`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`IdPembelian`),
  ADD KEY `IdBarang` (`IdBarang`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`IdPengguna`),
  ADD KEY `IdAkses` (`IdAkses`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`IdPenjualan`),
  ADD KEY `IdBarang` (`IdBarang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `IdBarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `hakakses`
--
ALTER TABLE `hakakses`
  MODIFY `IdAkses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `IdPembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `IdPengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `IdPenjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`IdPengguna`) REFERENCES `pengguna` (`IdPengguna`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`IdBarang`) REFERENCES `barang` (`IdBarang`);

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`IdAkses`) REFERENCES `hakakses` (`IdAkses`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`IdBarang`) REFERENCES `barang` (`IdBarang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
