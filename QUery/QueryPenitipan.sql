USE PENITIPAN_HEWAN

select * from kamar where status_kamar = 'Kosong'

select * from hewan_pelanggan where Nama_pemilik = 'Kelompok6'

select * from layanan

insert into penitipan values
( '0X555A', 'Kelompok6', 'Doggy', 1, '2021/12/25', '2021/12/27' )

--Simulasi insert 1 layanan
insert into pemesanan_layanan values
( '0X555A', '1' )

--Simulasi insert lebih dari 1
insert into pemesanan_layanan values
( '0X555A', '1' )
insert into pemesanan_layanan values
( '0X555A', '2' )

insert into pembayaran values
( '0X555B', 50000 )