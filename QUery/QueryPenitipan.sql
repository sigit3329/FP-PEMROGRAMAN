USE PENITIPAN_HEWAN

--MENGHITUNG TOTAL HARGA KAMAR PERHARI
SELECT 
	(kamar.harga_kamar * DATEDIFF(day, Tanggal_masuk, Tanggal_keluar))
	FROM penitipan
		JOIN kamar ON penitipan.No_kamar = kamar.No_kamar
	WHERE Kode_penitipan = 22
GO

--MENGHITUNG TOTAL HARGA LAYANAN YANG DIPILIH
SELECT SUM(layanan.harga)
	FROM pemesanan_layanan
		JOIN layanan ON pemesanan_layanan.id_layanan = layanan.No_layanan
	WHERE id_penitipan = 22
	GROUP BY id_penitipan
GO

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