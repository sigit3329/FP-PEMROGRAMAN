using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;


namespace fp.Model
{
    class KamarModel
    {
        //declare object
        private ModelTemplate template;

        //declare variabel
        public string noKamar { get; set; }
        public string jenisKamar { get; set; }
        public string hargaKamar { get; set; }
        public string statusKamar { get; set; }

        public KamarModel()
        {
            //instance 
            template = new ModelTemplate();
        }

        //show jumlah kamar kosong
        public string JumlahKamarKosong()
        {
            string result = "0";
            DataSet ds = new DataSet();
            string query = "select count(*) from kamar where status_kamar = 'Kosong'";
;           ds = template.SelectData(query, "kamar");
            result = ds.Tables[0].Rows[0][0].ToString();
            return result;
        }



        public DataSet KodePenitipan()
        {
            DataSet ds = new DataSet();
            string query = $"select Kode_penitipan, Nama_hewan from penitipan " +
                $"join hewan_pelanggan on penitipan.Nama_hewan = hewan_pelanggan.Nama " +
                $"join pelanggan on hewan_pelanggan.Nama_pemilik = pelanggan.Username " +
                $"where Tanggal_keluar <= GETDATE() AND Nama_pemilik = '{PelangganModel.namaUser}'";
            ds = template.SelectData(query,"kamar");
            return ds;
        }
        public DataSet HistoryKunjungan()
        {
            DataSet ds = new DataSet();
            string query = "select top 3 CONVERT(varchar(20),Tanggal_masuk, 106 ) as Tanggal, Nama_hewan from penitipan WHERE Nama_pemesan = '" + PelangganModel.namaUser + "' order by Tanggal_masuk desc";
            ds = template.SelectData(query, "kamar");
            return ds;
        }
        public bool Updatekamar()
        {
            string tabel = $"kamar";
            string data = $"status_kamar='Terisi'";
            string kondisi = $"Jenis_kamar = '{jenisKamar}'";
            return template.Update(tabel, data, kondisi);
        }
        public DataSet KamarKosong()
        {
            DataSet ds = new DataSet();
            string query = "select Jenis_kamar from kamar where status_kamar = 'Kosong'";
            ds = template.SelectData(query,"kamar");
            return ds;
        }
    }
}