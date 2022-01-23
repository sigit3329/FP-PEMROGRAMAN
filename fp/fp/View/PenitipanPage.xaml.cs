using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace fp.View
{
    /// <summary>
    /// Interaction logic for PenitipanPage.xaml
    /// </summary>
    public partial class PenitipanPage : Page
    {
        Controller.HewanPelanggan hewanPelanggan;
        Controller.Penitipan penitipan;
        Controller.Kamar kamar;
        public PenitipanPage()
        {
            InitializeComponent();
            hewanPelanggan = new Controller.HewanPelanggan(this);
            penitipan = new Controller.Penitipan(this);
            kamar = new Controller.Kamar(this);
            kamar.KamarKosong();
        }

        private void btnPesan_Click(object sender, RoutedEventArgs e)
        {
            kamar.UpdateKamarIsi();
            hewanPelanggan.TambahHewan();
            penitipan.TambahPenitipan();
            
        }

    }
}
