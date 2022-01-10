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
        public PenitipanPage()
        {
            InitializeComponent();
            hewanPelanggan = new Controller.HewanPelanggan(this);
            penitipan = new Controller.Penitipan(this);
        }

        private void btnPesan_Click(object sender, RoutedEventArgs e)
        {
            hewanPelanggan.TambahHewan();
            penitipan.TambahPenitipan();

            PreviewPage detail = new PreviewPage();
            detail.Show();

        }
    }
}
