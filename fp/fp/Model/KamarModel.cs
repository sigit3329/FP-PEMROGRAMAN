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
            string query = "select Kode_penitipan, Nama_hewan from penitipan where Tanggal_keluar < GETDATE()";
            ds = template.SelectData(query,"kamar");
            return ds;
        }
        public DataSet HistoryKunjungan()
        {
            DataSet ds = new DataSet();
            string query = "select top 3 CONVERT(varchar(20),Tanggal_masuk, 111 ) from penitipan order by Tanggal_masuk desc";
            ds = template.SelectData(query, "kamar");
            return ds;
        }
    }
}
