﻿using System;
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
using System.Windows.Shapes;

namespace fp.View
{
    /// <summary>
    /// Interaction logic for PreviewPage.xaml
    /// </summary>
    public partial class PreviewPage : Window
    {
        //public static variabel
        Controller.Penitipan penitipan;
        public PreviewPage()
        {
            InitializeComponent();
            penitipan = new Controller.Penitipan(this);
            
            penitipan.ShowPenitipanForm();
        }
    }
}
