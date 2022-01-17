USE PENITIPAN_HEWAN

--MENAMPILKAN JUMLAH KAMAR KOSONG
select count(*) from kamar 
	where status_kamar = 'Kosong'
GO

--MENAMPILKAN HISTORY PENITIPAN
select top 3 
	CONVERT(varchar(20),Tanggal_masuk, 111 ) from penitipan 
	order by Tanggal_masuk desc
GO

--MENAMPILKAN DATA NAMA HEWAN YANG HARUS CHECKOUT
SELECT Kode_penitipan, Nama_hewan from penitipan
		join hewan_pelanggan on penitipan.Nama_hewan = hewan_pelanggan.Nama
		join pelanggan on hewan_pelanggan.Nama_pemilik = pelanggan.Username
	WHERE Tanggal_keluar <= GETDATE() AND Nama_pemilik = 'kelompok6'
GO