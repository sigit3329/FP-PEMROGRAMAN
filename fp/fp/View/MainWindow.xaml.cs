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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void menuPenitipan1_MouseDown(object sender, MouseButtonEventArgs e)
        {
            FrmMain.Navigate(new View.PenitipanPage());
        }

        private void MenuProfil_MouseDown(object sender, MouseButtonEventArgs e)
        {
            FrmMain.Navigate(new View.ProfilePage());
        }

        private void MenuHistory_MouseDown(object sender, MouseButtonEventArgs e)
        {
            FrmMain.Navigate(new View.HistoryPage());
        }

        private void MenuExit_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Close();
        }

        private void Image_MouseDown(object sender, MouseButtonEventArgs e)
        {
            FrmMain.Navigate(new View.MainPage());
        }
    }
}
