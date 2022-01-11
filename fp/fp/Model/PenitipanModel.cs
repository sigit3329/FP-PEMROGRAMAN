using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace fp.Model
{
    class PenitipanModel
    {
        //create object
        ModelTemplate template;

        //declare variabel sesuai dengan field di tabel
        public string kodePenitipan { get; set; }
        public string nama { get; set; }
        public string namaHewan { get; set; }
        public int noKamar { get; set; }
        public string tanggalMasuk { get; set; }
        public string tanggalKeluar{ get; set; }

        //instance
        public PenitipanModel()
        {
            template = new ModelTemplate();
        }

        //Select data penitipan
        public DataSet dataPenitipan()
        {
            DataSet dsPenitipan = new DataSet();
            dsPenitipan = template.Select("penitipan", null);
            return dsPenitipan;
        }
        //insert data form penitipan
        public int InsertPenitipan()
        {
            string data = "'"+nama+ "', '" + namaHewan + "', " + noKamar + ", '" + tanggalMasuk + "', '" + tanggalKeluar + "'";

            return template.InsertReturnID("penitipan", data);
        }
        public int JumlahHargaKamar(int kodePenitipan)
        {
            int result = 0;
            DataSet ds = new DataSet();
            string query = $"SELECT (kamar.harga_kamar * DATEDIFF(day, Tanggal_masuk, Tanggal_keluar)) " +
                $"FROM penitipan JOIN kamar ON penitipan.No_kamar = kamar.No_kamar " +
                $"WHERE Kode_penitipan = {kodePenitipan}";
            ds = template.SelectData(query, "kamar");
            result = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            return result;
        }
        public int JumlahHargaLayanan(int kodePenitipan)
        {
            int result = 0;
            DataSet ds = new DataSet();
            string query = $"SELECT SUM(layanan.harga) " +
                $"FROM pemesanan_layanan JOIN layanan ON pemesanan_layanan.id_layanan = layanan.No_layanan " +
                $"WHERE id_penitipan = {kodePenitipan} " +
                $"GROUP BY id_penitipan";

            ds = template.SelectData(query, "pemesanan_layanan");
            result = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            return result;
        }
    }
}
