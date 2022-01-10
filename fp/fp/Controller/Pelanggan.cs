using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows;

namespace fp.Controller
{
    class Pelanggan//kalo class pake huruf kapital kalo object pake huruf kecil
    {
        //decalre object view dan model
        Model.PelangganModel pelanggan;
        View.LoginWindow login;
        View.ProfilePage profile;//KALO BUAT 2 VIEW HARUS BUAT OBJCET VIEW BARU

        //instance dalam constructor
        public Pelanggan(View.LoginWindow login)//pakai parameter dari view agar tidak bisa diakses dari class lain
        {
            pelanggan = new Model.PelangganModel();
            this.login = login;//pakai this karena object dan parameter namanya sama
        }
        public Pelanggan(View.ProfilePage profile)//KALO PAKE 2 VIEW HARUS BIKIN INSTANCE DI SINI JUGA
        {
            pelanggan = new Model.PelangganModel();
            this.profile = profile;//pakai this karena object dan parameter namanya sama
        }

        public void Login()
        {
            pelanggan.username = login.txtUsername.Text;
            pelanggan.password = login.txtPassword.Password;
            bool result = pelanggan.CekLogin();
            if (result)
            {
                View.MainWindow main = new View.MainWindow();
                main.Show();
                login.Close();
            }
            else
            {
                MessageBox.Show("Maaf username atau password anda salah !");
                login.txtUsername.Text = "";
                login.txtPassword.Password = "";
                login.txtUsername.Focus();
            }

        }
        View.RegisterWindow register;
        public Pelanggan(View.RegisterWindow register)
        {
            pelanggan = new Model.PelangganModel();
            this.register = register;
        }
        
        public void Register()
        {
            pelanggan.email = register.txtEmail.Text;
            pelanggan.username = register.txtUsername.Text;
            if(register.rdbLaki.IsChecked == true)
            {
                pelanggan.jk = "L";
            }
            else
            {
                pelanggan.jk = "P";
            }
            pelanggan.alamat = register.txtAlamat.Text;
            pelanggan.no_hp = register.txtHP.Text;
            pelanggan.password = register.txtPassword.Text;

            bool result = pelanggan.InsertPelanggan();
            if(result)
            {
                MessageBox.Show("Pembuatan akun baru berhasil," +
                    "Silahkan login menggunakan username dan password anda !");
                View.LoginWindow login = new View.LoginWindow();
                login.Show();
                register.Close();
            }
            else
            {
                MessageBox.Show("Maaf, pembuatan akun baru gagal," +
                    "Silahkan periksa dan lengkap data anda");
            }
        }

        public void ShowProfileData()
        {
            profile.txtNama.Text = Model.PelangganModel.namaUser;
            profile.txtNoHp.Text = Model.PelangganModel.noHpProfile;
            profile.txtAlamat.Text = Model.PelangganModel.alamatProfile;
            profile.txtEmail.Text = Model.PelangganModel.emailProfile;
        }

        //ini komentar ke 2

    }
}
