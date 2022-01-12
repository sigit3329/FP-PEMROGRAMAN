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
        Model.PemesananLayananModel pemesananLayananModel;
        View.HistoryPage historyPage;
        View.PenitipanPage penitipan;
        View.PreviewPage preview;
        Controller.HewanPelanggan hewanPelanggan;

        //instance
        public Penitipan(View.HistoryPage historyPage)
        {
            pemesananLayananModel = new Model.PemesananLayananModel();
            penitipanModel = new Model.PenitipanModel();
            this.historyPage = historyPage;
        }

        public Penitipan(View.PenitipanPage penitipan)
        {
            pemesananLayananModel = new Model.PemesananLayananModel();
            penitipanModel = new Model.PenitipanModel();
            this.penitipan = penitipan;
            this.preview = new View.PreviewPage();
        }

        public Penitipan(View.PreviewPage preview)
        {
            pemesananLayananModel = new Model.PemesananLayananModel();
            penitipanModel = new Model.PenitipanModel();
            this.preview = preview;
        }

        //show data penitipan kedalam datagrid pada MainPage
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
            penitipanModel.noKamar = noKamar;
            penitipanModel.tanggalMasuk = penitipan.dtpTanggalMasuk.SelectedDate.Value.ToString("yyyy-MM-dd");
            penitipanModel.tanggalKeluar = penitipan.dtpTanggalKeluar.SelectedDate.Value.ToString("yyyy-MM-dd");

            //proses insert
            int lastPenitipanID = penitipanModel.InsertPenitipan();//ini ada return last id
            //information
            if (lastPenitipanID > 0)
            {
                MessageBox.Show("data berhasil ditambahkan ke tabel penitipan");

                //memasukkan data ke dalam tabel pemesanan_layanan || column id_layanan 
                List<int> listLayanan = getListLayanan();

                foreach (int layanan in listLayanan)
                {
                    pemesananLayananModel.InsertPemesananLayanan(lastPenitipanID, layanan);//memasukkan yang 2,5,3 dll dari cbPenitipan ke dalam column id_layanan
                }

                //menampilkan preview layanan yang dipilih
                DataSet ds = pemesananLayananModel.GetPemesananLayanan(lastPenitipanID);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    String s = "";
                    for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
                    {
                        s += $"{ds.Tables[0].Rows[x][4]}, ";
                    }

                    preview.txtLayanan.Text = s;
                }
                //menampilkan data yang dipilih pada form penitipan
                preview.txtKodePenitipan.Text = lastPenitipanID.ToString();
                preview.txtNamaBinatang.Text = penitipanModel.nama.ToString();
                preview.txtNomorKamar.Text = noKamar.ToString();
                preview.txtTipeKamar.Text = penitipan.cmbJenisKamar.Text.ToString();
                int jumlahHarga = penitipanModel.JumlahHargaKamar(lastPenitipanID) + penitipanModel.JumlahHargaLayanan(lastPenitipanID);
                preview.txtTotalHarga.Text = jumlahHarga.ToString();
                preview.txtTanggalMasuk.Text = penitipanModel.tanggalMasuk.ToString();
                preview.txtTanggalKeluar.Text = penitipanModel.tanggalKeluar.ToString();

                preview.Show();
            }
            else
            {
                MessageBox.Show("data tidak berhasi ditambahkaan");
            }
        }

        private List<int> getListLayanan()
        {
            List<int> listLayanan = new List<int>();

            if (penitipan.cbGrooming.IsChecked == true) listLayanan.Add(1);
            if (penitipan.cbSterilisasi.IsChecked == true) listLayanan.Add(2);
            if (penitipan.cbVaksin.IsChecked == true) listLayanan.Add(3);
            if (penitipan.cbCheckUp.IsChecked == true) listLayanan.Add(4);
            if (penitipan.cbKawin.IsChecked == true) listLayanan.Add(5);
            if (penitipan.cbCukur.IsChecked == true) listLayanan.Add(6);

            return listLayanan;
        }

    }
}
