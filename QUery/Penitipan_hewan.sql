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
No_kamar int identity(1,1)  primary key not null,
Jenis_kamar varchar(20) check ( Jenis_kamar IN ( 'Regular', 'Small', 'Eksklusif' ) ) not null,
harga_kamar int not null

)

alter table kamar add status_kamar char(20) check ( status_kamar IN ( 'Kosong', 'Terisi' ) )

INSERT INTO kamar VALUES ('Regular', 10000 )

CREATE TABLE layanan (
No_layanan char(1) primary key not null,
Jenis_layanan varchar(20) check ( Jenis_layanan IN ( 'Grooming', 'Sterilisasi', 'Vaksin', 'Check Up', 'Kawin', 'Cukur' ) ) not null,
harga int not null
)

INSERT INTO layanan VALUES ( '1', 'Grooming', 50000 )

CREATE TABLE penitipan (
Kode_penitipan char(6) primary key not null,
Nama_pemesan varchar(20) foreign key references pelanggan(Username),
Nama_hewan varchar(20) foreign key references hewan_pelanggan(Nama),
No_kamar int foreign key references kamar(No_kamar),
Tanggal_masuk datetime not null,
Tanggal_keluar datetime not null,
)

INSERT INTO penitipan VALUES ( '0X555B', 'Kelompok6', 'Doggy', 1, '2021/12/25', '2021/12/27' )
INSERT INTO penitipan VALUES ( '0X555C', 'Kelompok6', 'Doggy', 1, '2022/01/1', '2021/12/27' )
INSERT INTO penitipan VALUES ( '0X555D', 'Kelompok6', 'Doggy', 1, '2022/01/6', '2021/12/27' )

create table pemesanan_layanan (
id_pemesanan_layanan int identity (1,1) primary key not null,
id_penitipan char(6) foreign key references penitipan(Kode_penitipan),
id_layanan char(1) foreign key references layanan(No_layanan),
)

insert into pemesanan_layanan values
( '0X555B', '1' )

create table pembayaran (
id_pembayaran int identity (1,1) primary key not null,
id_penitipan char(6) foreign key references penitipan(Kode_penitipan),
total_harga int not null,
)

insert into pembayaran values 
( '0X555B', 50000 )

drop table penitipan
drop table pemesanan_layanan
drop table pembayaran