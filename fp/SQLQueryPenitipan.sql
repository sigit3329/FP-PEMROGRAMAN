CREATE DATABASE PENITIPAN_HEWAN

USE PENITIPAN_HEWAN

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

CREATE TABLE hewan_pelanggan (
Nama varchar(20) primary key not null,
Nama_pemilik varchar(20) foreign key references pelanggan(Username),
Jenis_hewan varchar(20) not null,
Deskripsi_hewan varchar(50) not null
)

ALTER TABLE hewan_pelanggan ALTER COLUMN Deskripsi_hewan TEXT not null

INSERT INTO hewan_pelanggan VALUES ( 'Doggy', 'Kelompok6', 'Anjing', 'Coklat caramel terdapat luka di bagian bawah perutnya' )

CREATE TABLE kamar (
No_kamar char(4) not null,
Jenis_kamar varchar(20) check ( Jenis_kamar IN ( 'Regular', 'Small', 'Eksklusif' ) ) primary key not null,
Pemesan_kamar varchar(20) foreign key references pelanggan(Username),
)

INSERT INTO kamar VALUES ( '0001', 'Regular', 'Kelompok6' )

CREATE TABLE layanan (
No_layanan char(1) not null,
Jenis_layanan varchar(20) check ( Jenis_layanan IN ( 'Grooming', 'Sterilisasi', 'Vaksin', 'Check Up', 'Kawin', 'Cukur' ) ) primary key not null,
Nama_hewan varchar(20) foreign key references hewan_pelanggan(Nama)
)

INSERT INTO layanan VALUES ( '1', 'Grooming', 'Doggy' )

CREATE TABLE penitipan (
Kode_penitipan char(6) primary key not null,
Nama_pemesan varchar(20) foreign key references pelanggan(Username),
Alamat varchar(30) not null,
No_hp Bigint not null,
Nama_hewan varchar(20) foreign key references hewan_pelanggan(Nama),
Jenis_hewan varchar(20) not null,
Deskripsi_hewan TEXT not null,
Jenis_kamar varchar(20) foreign key references kamar(Jenis_kamar),
Jenis_layanan varchar(20) foreign key references layanan(Jenis_layanan),
Tanggal_masuk datetime not null,
Tanggal_keluar datetime not null,
)

INSERT INTO penitipan VALUES ( '0X555B', 'Kelompok6', 'Yogyakarta', '0889123456', 'Doggy', 'Anjing', 'Kaya Anjing', 'Regular', 'Grooming', '2021/12/25', '2021/12/27' )

SELECT * FROM pelanggan;
SELECT * FROM penitipan;