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
        private int idOrderNow;
        public OrderBasketWindow(int idOrderNow)
        {
            InitializeComponent();
            dgSelectedMedicines.ItemsSource = MedicinaEntities.GetContext().OrderDeyails.ToList();
            this.idOrderNow = idOrderNow;
        }

        private void btnMakeOrder_Click(object sender, RoutedEventArgs e)
        {
            foreach (var item in dgSelectedMedicines.Items)
            {
                var row = item as OrderDeyails; // Замените YourItemType на фактический тип элементов в вашем DataGrid
                
                if (row != null)
                {
                    int quantity = Convert.ToInt32(row.Quantity);
                    int idMedicine = Convert.ToInt32(row.IdMedicine);
                    int idOrder = idOrderNow; // Получить id заказа откуда-то
                    if(quantity !=0 && quantity > 0)
                    {
                        // Сохранение данных в базу данных
                        using (SqlConnection connection = new SqlConnection(LoginWindow.connectionString))
                        {
                            connection.Open();
                            string query = "INSERT INTO OrderDeyails (IdOrder, IdMedicine, Quantity) VALUES (@IdOrder, @IdMedicine, @Quantity)";
                            SqlCommand command = new SqlCommand(query, connection);
                            command.Parameters.AddWithValue("@IdOrder", idOrder);
                            command.Parameters.AddWithValue("@IdMedicine", idMedicine);
                            command.Parameters.AddWithValue("@Quantity", quantity);
                            command.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Введите кол-во медикаментов, которое хотите заказать");
                    }
                }
            }
            MessageBox.Show("Данные сохранены в базе данных.");
        }
        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
