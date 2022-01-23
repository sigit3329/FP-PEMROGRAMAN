using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fp.Model
{
    class HewanPelangganModel
    {
        //decalre object
        ModelTemplate template;

        //instance
        public HewanPelangganModel()
        {
            template = new ModelTemplate();
            
        }
        

        //variabel
        public string namaHewan { get; set; }
        public string namaPemilik { get; set; }
        public string jenisHewan { get; set; }
        public string deskripsiHewan { get; set; }

        //insert data 
        public bool InsertDataHewan()
        {
            string data = "'"+namaHewan+"','"+ namaPemilik + "','" + jenisHewan + "',''";
            return template.Insert("hewan_pelanggan", data);
        }
    }
}
