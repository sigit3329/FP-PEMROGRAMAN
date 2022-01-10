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
        public bool InsertPenitipan()
        {
            string data = "'"+nama+ "', '" + namaHewan + "', " + noKamar + ", '" + tanggalMasuk + "', '" + tanggalKeluar + "'";
            return template.Insert("penitipan", data);
        }
    }
}
