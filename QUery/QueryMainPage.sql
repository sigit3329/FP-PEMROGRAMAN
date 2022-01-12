USE PENITIPAN_HEWAN_BARU

--MENAMPILKAN JUMLAH KAMAR KOSONG
select count(*) from kamar 
	where status_kamar = 'Kosong'
GO

--MENAMPILKAN HISTORY PENITIPAN
select top 3
	CONVERT(varchar(20),Tanggal_masuk, 106 ) as Tanggal, Nama_hewan from penitipan 
	WHERE Nama_pemesan = 'jaka'
	order by Tanggal_masuk 
GO
	SELECT * FROM penitipan where Nama_pemesan = 'jaka'

--MENAMPILKAN DATA NAMA HEWAN YANG HARUS CHECKOUT
SELECT Kode_penitipan, Nama_hewan from penitipan
		join hewan_pelanggan on penitipan.Nama_hewan = hewan_pelanggan.Nama
		join pelanggan on hewan_pelanggan.Nama_pemilik = pelanggan.Username
	WHERE Tanggal_keluar <= GETDATE() AND Nama_pemilik = 'jaka'
GO