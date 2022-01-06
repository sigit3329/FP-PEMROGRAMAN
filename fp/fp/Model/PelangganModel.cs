using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;//agar dataset dikenali
using System.Data.SqlClient;
using System.Windows;

namespace fp.Model
{

    class PelangganModel
    {
        //CLASS ITU CETAKANNYA, OBJECT ITU ISINYA

        ModelTemplate temp;//declare object model template

        //instace gunanya untuk menyambungkan object ke class
        public PelangganModel()
        {
            temp = new ModelTemplate();//object "temp" terhubung dengan class ModelTemplate
        }

        //deklarasi variabel yang digunakan berdasarkan pada database
        public string username { get; set; }

        public string no_hp { get; set; }

        public string alamat { get; set; }

        public string email { get; set; }

        public string password { get; set; }

        public string jk { get; set; }

        public static string namaUser;

        //function validasi login
        public Boolean CekLogin()
        {
            bool result;
            DataSet ds = new DataSet();
            ds = temp.Select("pelanggan", "Username = '" + username + "' AND pw = '" + password + "'");//karena id tipenya char / varchar maka harus pakea tipe 1

            if (ds.Tables[0].Rows.Count > 0)//jika jumlah barisnya lebih dari 0 maka ada datanya
            {
                result = true;
                namaUser = ds.Tables[0].Rows[0][1].ToString();
            }
            else
            {
                result = false;
            }
            return result;
        }
        public bool InsertPelanggan()
        {
            string data = "'" + username + "','" + no_hp + "','" + alamat + "','" + email + "','" + password + "','" + jk + "'";
            return temp.Insert("pelanggan", data);
        }


    }
}
