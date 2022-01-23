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
    /// Interaction logic for MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        Controller.Kamar kamar;
        public MainPage()
        {
            InitializeComponent();

            //instance
            kamar = new Controller.Kamar(this);
            kamar.ShowKamarKosong();
            kamar.DataKodePenitipan();
            kamar.DataHistoryKunjungan();
        }
    }
}
