using Diplom_Hospital.Classes;
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
using System.Windows.Shapes;
using Diplom_Hospital.Pages;
using Diplom_Hospital.Model;
using System.Data;
using System.Runtime.Remoting.Contexts;
using System.Net;
using System.Xml.Linq;

namespace Diplom_Hospital.Wind
{
    /// <summary>
    /// Логика взаимодействия для OrderBasketWindow.xaml
    /// </summary>
    public partial class OrderBasketWindow : Window
    {
        public OrderBasketWindow(List<Medicine> selectedMed)
        {
            InitializeComponent();
            dgSelectedMedicines.ItemsSource = MedicinaEntities.GetContext().OrderDeyails.ToList();
        }

        private void btnMakeOrder_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string connectionString = $"Data Source={LoginWindow.serverName}\\SQLEXPRESS;Initial Catalog=Medicina;Integrated Security=True";
                string query = "INSERT INTO OrderDeyails (IdOrder, IdMedicine, Quantity) VALUES (@IdOrder, @IdMedicine, @Quantity)";

                // string query3 = "INSERT INTO Location (Num_room) VALUES (@Num_room)";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@IdOrder", IdOrd);
                    command.Parameters.AddWithValue("@IdMedicine", IdMed);
                    command.Parameters.AddWithValue("@Quantity", Quan);
                    command.ExecuteNonQuery();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ОШИБКA", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
