using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace fp.Model
{
    class PemesananLayananModel
    {
        ModelTemplate template;

        public PemesananLayananModel()
        {
            template = new ModelTemplate();
        }

        public Boolean InsertPemesananLayanan(int penitipan, int layanan)
        {
            string data = $"{penitipan}, {layanan}";
            return template.Insert("pemesanan_layanan", data);//ini memasukkan yang 2, 3, 4, 5, dll
        }

        public DataSet GetPemesananLayananBo(int penitipan)
        {
            string query = "SELECT * FROM pemesanan_layanan JOIN layanan ON pemesanan_layanan.id_layanan = layanan.No_layanan WHERE id_penitipan = "+penitipan+"";
            return template.SelectData(query, "pemesanan_layanan");
        }
    }
}
