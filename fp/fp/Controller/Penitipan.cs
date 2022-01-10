using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Windows;

namespace fp.Controller
{
    class Penitipan
    {
        //declare object untuk view dan model
        Model.PenitipanModel penitipanModel;
        View.HistoryPage historyPage;
        View.PenitipanPage penitipan;
        View.PreviewPage preview;
        Controller.HewanPelanggan hewanPelanggan;

        //instance
        public Penitipan(View.HistoryPage historyPage)
        {
            penitipanModel = new Model.PenitipanModel();
            this.historyPage = historyPage;
        }

        public Penitipan(View.PenitipanPage penitipan)
        {
            penitipanModel = new Model.PenitipanModel();
            this.penitipan = penitipan;
        }

        public Penitipan(View.PreviewPage preview)
        {
            penitipanModel = new Model.PenitipanModel();
            this.preview = preview;
        }

        //show data penitipan kedalam datagrid
        public void dataPenitipan()
        {
            DataSet data = penitipanModel.dataPenitipan();
            historyPage.dgKodePenitipan.ItemsSource = data.Tables[0].DefaultView;
        }
        public static string nama = Controller.HewanPelanggan.nama;

        //insert data
        public void TambahPenitipan()
        {
            penitipanModel.nama = Controller.HewanPelanggan.nama;
            penitipanModel.namaHewan = penitipan.txtNamaHewan.Text;
            int noKamar = 0;
            if(penitipan.cmbJenisKamar.Text == "Regular")
            {
                noKamar = 1;
            }else if(penitipan.cmbJenisKamar.Text == "Small")
            {
                noKamar = 2;
            }
            else
            {
                noKamar = 3;
            }
            penitipanModel.noKamar = noKamar;
            penitipanModel.tanggalMasuk = penitipan.dtpTanggalMasuk.SelectedDate.Value.ToString("yyyy-MM-dd");
            penitipanModel.tanggalKeluar = penitipan.dtpTanggalKeluar.SelectedDate.Value.ToString("yyyy-MM-dd");

            //proses insert
            bool result = penitipanModel.InsertPenitipan();
            //information
            if (result)
            {
                MessageBox.Show("data berhasil ditambahkan ke tabel penitipan");
            }
            else
            {
                MessageBox.Show("data tidak berhasi ditambahkaan");
            }

        }
        /*public void ShowPenitipanForm()
        {
            preview.txtNamaBinatang.Text = penitipan.txtNamaHewan.Text;
            int noKamar = 0;
            if (penitipan.cmbJenisKamar.Text == "Regular")
            {
                noKamar = 1;
            }
            else if (penitipan.cmbJenisKamar.Text == "Small")
            {
                noKamar = 2;
            }
            else
            {
                noKamar = 3;
            }
            preview.txtNomorKamar.Text = noKamar.ToString();
            preview.txtTanggalMasuk.Text = penitipan.dtpTanggalMasuk.SelectedDate.Value.ToString("yyyy-MM-dd");
            preview.txtTanggalKeluar.Text = penitipan.dtpTanggalKeluar.SelectedDate.Value.ToString("yyyy-MM-dd");

        }*/

    }
}
