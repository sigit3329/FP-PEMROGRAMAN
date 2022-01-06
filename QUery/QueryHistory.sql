USE PENITIPAN_HEWAN

select Kode_penitipan, Nama, Jenis_hewan, penitipan.No_kamar, Jenis_kamar, Tanggal_masuk, Tanggal_keluar from penitipan
join kamar on penitipan.No_kamar = kamar.No_kamar
join hewan_pelanggan on penitipan.Nama_hewan = hewan_pelanggan.Nama