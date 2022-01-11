using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Windows;

namespace fp.Controller
{
    class Kamar
    {
        //decalre object
        Model.KamarModel kamar;
        View.MainPage main;

        //instance
        public Kamar(View.MainPage main)
        {
            kamar = new Model.KamarModel();
            this.main = main;
        }
        public void ShowKamarKosong()
        {
            main.lblJmlKamarKosong.Content = kamar.JumlahKamarKosong();
        }

        public void DataKodePenitipan()
        {
            DataSet ds = kamar.KodePenitipan();
            main.dgKodePenitipan.ItemsSource = ds.Tables[0].DefaultView;
        }
        public void DataHistoryKunjungan()
        {
            DataSet ds = kamar.HistoryKunjungan();
            main.dgHistoriKunjungan.ItemsSource = ds.Tables[0].DefaultView;
        }

    }
}
