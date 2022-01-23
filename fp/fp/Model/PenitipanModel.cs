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
        public string kode { get; set; }
        public string nama { get; set; }
        public string alamat { get; set; }
        public int noHp { get; set; }
        public string namaHewan { get; set; }
        public string descHewan { get; set; }
        public string jenisHewan { get; set; }
        public string jenisLayanan { get; set; }
        public string tanggalMasuk { get; set; }
        public string tanggalKeluat { get; set; }

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
    }
}
