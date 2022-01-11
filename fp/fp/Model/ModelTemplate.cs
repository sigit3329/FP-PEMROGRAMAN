using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows;

namespace fp.Model
{
    class ModelTemplate
    {
        private static SqlConnection conn; //menghubungkan aplikasi dengan database
        private SqlCommand command;//untuk mengeksekusi query
        private bool result;

        //database connection
        public static SqlConnection GetConnection()
        {
            //instance
            conn = new SqlConnection();
            //set connection
            conn.ConnectionString = @"Data Source = LAPTOP-RQAD3GT0\SQLEXPRESS;" +
                                    "Initial Catalog = PENITIPAN_HEWAN_BARU;" +
                                    "Integrated Security = True";

            return conn;
        }

        public ModelTemplate()
        {
            GetConnection();//dimasukkan kedalam constructor
                            //karena contrcutor adalah function yang dijalankan pertama kali ketika kelas itu di instance
        }

        //template select data
        public DataSet Select(string tabel, string kondisi)
        {
            DataSet ds = new DataSet();

            try//try dan catch sebagai eror handling
            {
                conn.Open();
                command = new SqlCommand();
                command.Connection = conn;
                command.CommandType = CommandType.Text;
                if (kondisi == null)
                {
                    command.CommandText = "SELECT * FROM " + tabel;
                }
                else
                {
                    command.CommandText = "SELECT * FROM " + tabel + " WHERE " + kondisi;
                }
                SqlDataAdapter sda = new SqlDataAdapter(command);//untuk menyimpan data hasil dari execute command query
                sda.Fill(ds, tabel);
            }
            catch (SqlException)
            {
                ds = null;
            }
            conn.Close();//close koneksi ke ds agar aplikasi tidak terlalu berat
            return ds;
        }

        public DataSet SelectJoinOne(string tabel, string kondisi, string join)
        {
            DataSet ds = new DataSet();

            try//try dan catch sebagai eror handling
            {
                conn.Open();
                command = new SqlCommand();
                command.Connection = conn;
                command.CommandType = CommandType.Text;
                if (kondisi == null)
                {
                    command.CommandText = "SELECT * FROM " + tabel + " JOIN " + join;
                }
                else
                {
                    command.CommandText = "SELECT * FROM " + tabel +  " JOIN " + join + " WHERE " + kondisi;
                }
                SqlDataAdapter sda = new SqlDataAdapter(command);//untuk menyimpan data hasil dari execute command query
                sda.Fill(ds, tabel);
            }
            catch (SqlException)
            {
                ds = null;
            }
            conn.Close();//close koneksi ke ds agar aplikasi tidak terlalu berat
            return ds;
        }

        //template select data (counting, top, grouping dll)
        public DataSet SelectData(string query, string tabel)//menggunakan dataSet agar dapat menampung semua data dapat ditampilkan
                                                             // kalo pake yang lain juga bisa, tapi yang ditampikan hanya 1 dan data yang paling terakhir
        {
            DataSet ds = new DataSet();
            //ERROR HANDLING
            try
            {
                conn.Open();//membuka koneksi
                command = new SqlCommand();
                command.Connection = conn;
                command.CommandType = CommandType.Text;
                command.CommandText = query;
                SqlDataAdapter sda = new SqlDataAdapter(command);//semua data yang dicari ditampung disini
                sda.Fill(ds, tabel);// kemudian dimasukkan ke dataset
            }
            catch (SqlException)
            {
                ds = null;
            }
            conn.Close();//kalo dibuka harus ditutup kembali koneksinya
            return ds;
        }

        //template insert data
        public Boolean Insert(string tabel, string data)//menggunakan bool karena insert itu true dan flse
        {
            result = false;
            try
            {
                string query = "INSERT INTO " + tabel + " VALUES (" + data + ")";
                conn.Open();
                command = new SqlCommand();
                command.Connection = conn;
                command.CommandText = query;
                command.ExecuteNonQuery();
                result = true;
            }
            catch (SqlException ex)
            {
                result = false;
                MessageBox.Show("Error : " + ex);
            }
            conn.Close();
            return result;
        }

        public int InsertReturnID(string tabel, string data)//menggunakan bool karena insert itu true dan flse
        {
            int lastID = 0;
            try
            {
                string query = "INSERT INTO " + tabel + " VALUES (" + data + ") SELECT SCOPE_IDENTITY()";
                conn.Open();
                command = new SqlCommand();
                command.Connection = conn;
                command.CommandText = query;
                lastID = Convert.ToInt32(command.ExecuteScalar());
                result = true;
            }
            catch (SqlException)
            {
                result = false;
            }
            conn.Close();
            return lastID;
        }

        //template update data
        public Boolean Update(string tabel, string data, string kondisi)
        {
            result = false;
            try
            {
                string query = "UPDATE " + tabel + " SET " + data + " WHERE " + kondisi;
                conn.Open();
                command = new SqlCommand();
                command.Connection = conn;
                command.CommandText = query;
                command.ExecuteNonQuery();
                result = true;
            }
            catch (SqlException)
            {
                result = false;
            }
            conn.Close();
            return result;
        }

        //template delete data
        public Boolean Delete(string tabel, string kondisi)
        {
            result = false;
            try
            {
                string query = "DELETE FROM " + tabel + " WHERE " + kondisi;
                conn.Open();
                command = new SqlCommand();
                command.Connection = conn;
                command.CommandText = query;
                command.ExecuteNonQuery();
                result = true;
            }
            catch (SqlException)
            {
                result = false;
            }
            conn.Close();
            return result;
        }

    }
}
