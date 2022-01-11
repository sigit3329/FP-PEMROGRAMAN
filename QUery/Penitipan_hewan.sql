CREATE DATABASE PENITIPAN_HEWAN

USE PENITIPAN_HEWAN

--CREATE TABLE PELANGGAN
CREATE TABLE pelanggan (
Username varchar(20) primary key not null,
No_hp int not null,
Alamat varchar(20) not null,
Email varchar(20) not null,
Pw varchar(20) not null,
Jenis_kelamin char(1) check ( Jenis_kelamin IN ( 'L', 'P' ) )
)

INSERT INTO pelanggan VALUES ( 'Kelompok6', 0881234567, 'Yogyakarta', 'kelompok6@gmail.com', 'kelompok6', 'L' )

ALTER TABLE pelanggan ALTER COLUMN No_hp Bigint not null
--CREATE TABLE HEWAN PELANGGAN
CREATE TABLE hewan_pelanggan (
Nama varchar(20) primary key not null,
Nama_pemilik varchar(20) foreign key references pelanggan(Username),
Jenis_hewan varchar(20) not null,
Deskripsi_hewan varchar(50) not null
)

ALTER TABLE hewan_pelanggan ALTER COLUMN Deskripsi_hewan TEXT not null

INSERT INTO hewan_pelanggan VALUES ( 'Doggy', 'Kelompok6', 'Anjing', 'Coklat caramel terdapat luka di bagian bawah perutnya' )
--CREATE TABEL KAMAR
CREATE TABLE kamar (
No_kamar int identity(1,1)  primary key not null,
Jenis_kamar varchar(20) check ( Jenis_kamar IN ( 'Regular', 'Small', 'Eksklusif' ) ) not null,
harga_kamar int not null

)

alter table kamar add status_kamar char(20) check ( status_kamar IN ( 'Kosong', 'Terisi' ) )

INSERT INTO kamar VALUES ('Small', 5000,'kosong' )
INSERT INTO kamar VALUES ('Eksklusif', 20000, 'kosong' )
--CREATE TABEL LAYANAN
CREATE TABLE layanan (
No_layanan char(1) primary key not null,
Jenis_layanan varchar(20) check ( Jenis_layanan IN ( 'Grooming', 'Sterilisasi', 'Vaksin', 'Check Up', 'Kawin', 'Cukur' ) ) not null,
harga int not null
)

INSERT INTO layanan VALUES ( '1', 'Grooming', 50000 )
INSERT INTO layanan VALUES ( '2', 'Sterilisasi', 55000 )
INSERT INTO layanan VALUES ( '3', 'Vaksin', 45000 )
INSERT INTO layanan VALUES ( '4', 'Check Up', 30000 )
INSERT INTO layanan VALUES ( '5', 'Kawin', 60000 )
INSERT INTO layanan VALUES ( '6', 'Cukur', 30000 )

--CREATE TABEL PENITIPAN
CREATE TABLE penitipan (
Kode_penitipan int identity (1,1) primary key not null,
Nama_pemesan varchar(20) foreign key references pelanggan(Username),
Nama_hewan varchar(20) foreign key references hewan_pelanggan(Nama),
No_kamar int foreign key references kamar(No_kamar),
Tanggal_masuk datetime not null,
Tanggal_keluar datetime not null,
)

ALTER TABLE penitipan ALTER COLUMN Kode_penitipan identity (1,1)  not null
Alter Table penitipan Drop Column Kode_penitipan

INSERT INTO penitipan VALUES (  'Kelompok6', 'Doggy', 1, '2021/12/25', '2021/12/27' )
INSERT INTO penitipan VALUES (  'Kelompok6', 'Doggy', 1, '2022/01/1', '2021/12/27' )
INSERT INTO penitipan VALUES (  'Kelompok6', 'Doggy', 1, '2022/01/6', '2021/12/27' )
INSERT INTO penitipan VALUES ( 'tsaqif', 'Doggy', 1, '2022/01/6', '2021/12/27' )

--CREATE TABEL PEMESANAN LAYANAN
create table pemesanan_layanan (
id_pemesanan_layanan int identity (1,1) primary key not null,
id_penitipan int foreign key references penitipan(Kode_penitipan),
id_layanan char(1) foreign key references layanan(No_layanan),
)

insert into pemesanan_layanan values
( '0X555B', '1' )
--CREATE TABEL PEMBAYARAN
create table pembayaran (
id_pembayaran int identity (1,1) primary key not null,
id_penitipan int foreign key references penitipan(Kode_penitipan),
total_harga int not null,
)

insert into pembayaran values 
( '0X555B', 50000 )

drop table penitipan
drop table pemesanan_layanan
drop table pembayaran
select * from penitipan
select * from kamar
select * from layanan
select * from pemesanan_layanan
select * from hewan_pelanggan
select * from pelanggan

INSERT INTO hewan_pelanggan VALUES ( 'AWKOAWO', 'Kelompok6', 'KURA-KURA','')

DELETE FROM kamar WHERE No_kamar=5
DELETE FROM kamar WHERE No_kamar=6

--untuk reset int identity
DBCC CHECKIDENT ('kamar', RESEED, 1)

SELECT * FROM pemesanan_layanan JOIN layanan ON pemesanan_layanan.id_layanan = layanan.No_layanan;

SELECT 
	Kode_penitipan, Tanggal_masuk, Tanggal_keluar, DATEDIFF(day, Tanggal_masuk, Tanggal_keluar) AS 'Perbedaan Tanggal'
	FROM penitipan
GO

SELECT 
	(kamar.harga_kamar * DATEDIFF(day, Tanggal_masuk, Tanggal_keluar))
	FROM penitipan
		JOIN kamar ON penitipan.No_kamar = kamar.No_kamar
	WHERE Kode_penitipan = 22

SELECT SUM(layanan.harga)
	FROM pemesanan_layanan
		JOIN layanan ON pemesanan_layanan.id_layanan = layanan.No_layanan
	WHERE id_penitipan = 22
	GROUP BY id_penitipan

	select Kode_penitipan, Nama_hewan from penitipan where Tanggal_keluar <= GETDATE()
	select Kode_penitipan, Nama_hewan from penitipan
		join hewan_pelanggan on penitipan.Nama_hewan = hewan_pelanggan.Nama
		join pelanggan on hewan_pelanggan.Nama_pemilik = pelanggan.Username
		where Tanggal_keluar <= GETDATE() AND Nama_pemilik = 'jaka'