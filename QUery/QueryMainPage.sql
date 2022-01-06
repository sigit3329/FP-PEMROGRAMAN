USE PENITIPAN_HEWAN

select count(*) from kamar where status_kamar = 'Kosong'

select Kode_penitipan, Nama_hewan from penitipan where Tanggal_keluar < GETDATE()

select top 3 CONVERT(varchar(20),Tanggal_masuk, 111 ) from penitipan order by Tanggal_masuk desc