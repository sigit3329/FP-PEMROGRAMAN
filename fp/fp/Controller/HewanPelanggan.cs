using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace fp.Controller
{
    class HewanPelanggan
    {
        //declare object
        Model.HewanPelangganModel hewanPelanggan;
        Model.PelangganModel pelanggan;
        View.PenitipanPage penitipan;


        //instance
        public HewanPelanggan(View.PenitipanPage penitipan)
        {
            hewanPelanggan = new Model.HewanPelangganModel();
            this.penitipan = penitipan;
        }

        //variabel static nama
        public static string nama = Model.PelangganModel.namaUser;

        //insert data
        public void TambahHewan()
        {
            hewanPelanggan.namaHewan = penitipan.txtNamaHewan.Text;
            hewanPelanggan.namaPemilik = Model.PelangganModel.namaUser;
            hewanPelanggan.jenisHewan = penitipan.cmbProfileHewan.Text;
            //proses input
            bool result = hewanPelanggan.InsertDataHewan();
            //information
            if (result)
            {
                MessageBox.Show("data berhasil ditambahkan");

            }
            else
            {
                MessageBox.Show("tidak bisa memasukkan data");
                MessageBox.Show("Nama Hewan : " + hewanPelanggan.namaHewan);
                MessageBox.Show("namaPemliki : "+ hewanPelanggan.namaPemilik);
                MessageBox.Show("hewan jenis : "+ hewanPelanggan.jenisHewan);

            }
        }
    }
}
