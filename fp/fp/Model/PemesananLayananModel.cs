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
            return template.Insert("pemesanan_layanan", data);
        }

        public DataSet GetPemesananLayanan(int penitipan)
        {
            string kondisi = $"id_penitipan = {penitipan}";
            string join = "layanan ON pemesanan_layanan.id_layanan = layanan.No_layanan";
            return template.SelectJoinOne("pemesanan_layanan", kondisi, join);
        }
    }
}
