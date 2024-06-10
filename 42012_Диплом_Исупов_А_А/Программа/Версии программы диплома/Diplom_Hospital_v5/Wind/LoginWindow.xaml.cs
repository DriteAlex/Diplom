using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

namespace Diplom_Hospital
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        static public int idEmpRes;
        static public int idDepart;
        static public string serverName = Environment.MachineName;
        static public string connectionString;
        public LoginWindow()
        {
            InitializeComponent();
            idDepart = 0;
        }

        private void EnterButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                connectionString = $"Data Source={serverName}\\SQLEXPRESS;Initial Catalog=Medicina;Integrated Security=True";
                string login = tbLogin.Text;
                string password = tbPassword.Text;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT IdEmployee FROM Users WHERE Login = @Login AND Password = @Password";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Login", login);
                    command.Parameters.AddWithValue("@Password", password);

                    object result = command.ExecuteScalar();

                    if (result != null)
                    {
                        idEmpRes = Convert.ToInt32(result);
                    }
                    connection.Close();
                }
                
                


                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    var command = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Login = @Login AND Password = @Password", connection);
                    command.Parameters.AddWithValue("@Login", tbLogin.Text);
                    command.Parameters.AddWithValue("@Password", tbPassword.Text);

                    int count = (int)command.ExecuteScalar();

                    if (count == 0)
                    {
                        throw new Exception("Пользователь не найден");
                    }
                    else
                    {
                        // Скрыть окно входа и открыть главное окно
                        LeadWindow lw = new LeadWindow();
                        lw.Show();
                        Close();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
