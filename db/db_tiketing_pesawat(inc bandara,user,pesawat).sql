-- Adminer 4.7.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `tb_bandara`;
CREATE TABLE `tb_bandara` (
  `id_bandara` varchar(11) NOT NULL,
  `kode` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  PRIMARY KEY (`id_bandara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tb_bandara` (`id_bandara`, `kode`, `nama`, `kota`) VALUES
('BAN180001',	'SRG',	' Bandar Udara Internasional Achmad Yani',	'Semarang'),
('BAN180002',	'CGK ',	' Bandar Udara Internasional Soekarno-Hatta',	'Tangerang'),
('BAN180003',	'HLP',	'Bandar Udara Internasional Halim Perdanakusuma',	'Jakarta'),
('BAN180004',	'DPS ',	' Bandar Udara Internasional Ngurah Rai',	'Denpasar'),
('BAN180005',	'BPN',	' Bandar Udara Sultan Aji Muhammad Sulaiman',	'Balik Papan'),
('BAN180006',	'JOG',	' Bandar Udara Internasional Adisutjipto',	'Seleman'),
('BAN180007',	'BDO',	'Bandar Udara Internasional Husein Sastranegara',	'Bandung'),
('BAN180008',	'SUB',	'Bandar Udara Internasional Juanda',	'Sidoarjo'),
('BAN180009',	'MDC ',	' Bandar Udara Internasional Sam Ratulangi',	'Manado'),
('BAN180010',	'DJJ',	' Bandar Udara Internasional Sentani',	'Jayapura');

DROP TABLE IF EXISTS `tb_booking`;
CREATE TABLE `tb_booking` (
  `id_booking` varchar(11) NOT NULL,
  `id_customer` varchar(11) NOT NULL,
  `tgl_booking` date NOT NULL,
  `jumlah_penumpang` int(11) NOT NULL,
  `total_tarif` varchar(255) NOT NULL,
  `status_bayar` varchar(255) NOT NULL,
  PRIMARY KEY (`id_booking`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `id_customer` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `negara` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tb_dtl_booking`;
CREATE TABLE `tb_dtl_booking` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_tarif` varchar(11) NOT NULL,
  `id_booking` varchar(11) NOT NULL,
  PRIMARY KEY (`id_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tb_passenger`;
CREATE TABLE `tb_passenger` (
  `id_passenger` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `no_kursi` varchar(50) NOT NULL,
  `id_detail` int(11) NOT NULL,
  PRIMARY KEY (`id_passenger`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tb_penerbangan`;
CREATE TABLE `tb_penerbangan` (
  `id_penerbangan` varchar(11) NOT NULL,
  `id_bandara` varchar(11) NOT NULL,
  `id_pesawat` varchar(11) NOT NULL,
  `tgl_penerbangan` date NOT NULL,
  `asal` varchar(255) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `jam_berangkat` time NOT NULL,
  `jam_tiba` time NOT NULL,
  `bandara_tujuan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_penerbangan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tb_pesawat`;
CREATE TABLE `tb_pesawat` (
  `id_pesawat` varchar(11) NOT NULL,
  `tipe_pesawat` varchar(255) NOT NULL,
  `jml_kursi_ekonomi` varchar(255) NOT NULL,
  `jml_kursi_bisnis` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pesawat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tb_pesawat` (`id_pesawat`, `tipe_pesawat`, `jml_kursi_ekonomi`, `jml_kursi_bisnis`) VALUES
('PES180001',	'Airbus A330-300',	'213',	'34'),
('PES180002',	'Boeing 737 Max 8',	'162',	'8'),
('PES180003',	'Airbus A330-200',	'186',	'36'),
('PES180004',	'Bombardier CRJ1000 NextGen',	'96',	'0'),
('PES180005',	'ATR 72-600',	'66',	'0'),
('PES180006',	'Boeing 777-300ER',	'26',	'367'),
('PES180007',	'Boeing 737-800NG',	'150',	'12');

DROP TABLE IF EXISTS `tb_tarif_penerbangan`;
CREATE TABLE `tb_tarif_penerbangan` (
  `id_tarif` varchar(11) NOT NULL,
  `id_penerbangan` varchar(11) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `tarif` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tarif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(15) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`) VALUES
(1,	'admin',	'21232f297a57a5a743894a0e4a801fc3',	'admin'),
(2,	'manager',	'1d0258c2440a8d19e716292b231e3190',	'manager'),
(3,	'petugas',	'afb91ef692fd08c445e8cb1bab2ccf9c',	'petugas'),
(4,	'su',	'0b180078d994cb2b5ed89d7ce8e7eea2',	'superuser');

-- 2018-11-30 03:33:38