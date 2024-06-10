using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
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
using Diplom_Hospital.Model;
using Diplom_Hospital.Wind;
namespace Diplom_Hospital.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrderPage.xaml
    /// </summary>
    public partial class OrderPage : Page
    {
        private static Category medical;
        private static List<Medicine> medicines;
        public int idDepart;
        public OrderPage()
        {
            InitializeComponent();
            cbCategory.ItemsSource = MedicinaEntities.GetContext().Category.ToList();
            cbCategory.SelectedIndex = 0;
            medicines = MedicinaEntities.GetContext().Medicine.ToList();
            dgMedicine.ItemsSource = medicines;
            idDepart = 0;
        }
        private void tbSearh_TextChanged(object sender, TextChangedEventArgs e)
        {
            var currentMedicine = MedicinaEntities.GetContext().Medicine.ToList();
            currentMedicine = currentMedicine.Where(p => p.MedicineName.ToLower().Contains(tbSearh.Text.ToLower()) ||
            p.Category.NameCategory.ToLower().Contains(tbSearh.Text.ToLower()) ||
            p.Description.ToLower().Contains(tbSearh.Text.ToLower())).ToList();
            dgMedicine.ItemsSource = currentMedicine;
        }

        private void BtnFilter_Click(object sender, RoutedEventArgs e)
        {

            medicines = MedicinaEntities.GetContext().Medicine.ToList();

            if (cbCategory.SelectedIndex >= 0)
            {
                medical = cbCategory.SelectedItem as Category;
                if (medical != null)
                {
                    medicines = medicines.Where(p => p.Category.Id == medical.Id).ToList();

                }

            }
            
            dgMedicine.ItemsSource = medicines;
        }

        private void BtnClear_Click(object sender, RoutedEventArgs e)
        {
            cbCategory.SelectedIndex = 0;
            medicines = MedicinaEntities.GetContext().Medicine.ToList();
            dgMedicine.ItemsSource = medicines;
        }

        private void btnOrderBasket_Click(object sender, RoutedEventArgs e)
        {
            /*using (SqlConnection connection = new SqlConnection(LoginWindow.connectionString))
            {
                connection.Open();
                string query = "SELECT IdHospitalDepartment FROM Employee WHERE Id = @Id";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", LoginWindow.idEmpRes);

                object result = command.ExecuteScalar();

                if (result != null)
                {
                    idDepart = Convert.ToInt32(result);
                }
                connection.Close();
            }*/
            MedicinaEntities _context = MedicinaEntities.GetContext();
            Orders orders = new Orders
            {
                DateOrder = DateTime.Now,
                IdDepartament = 15,
                IdEmployee = LoginWindow.idEmpRes
            };

                _context.Orders.Add(orders);
            
            _context.SaveChanges();

            MedicinaEntities context = MedicinaEntities.GetContext();
            foreach (Medicine selectedMedicine in dgMedicine.SelectedItems)
            {
                int selectedMedicineId = selectedMedicine.Id;

                OrderDeyails newOrderDetail = new OrderDeyails
                {

                    IdMedicine = selectedMedicineId,
                };

                context.OrderDeyails.Add(newOrderDetail);
            }
            context.SaveChanges();

            /*OrderBasketWindow ob=new OrderBasketWindow();
            ob.Show();

            List<Medicine> selectedMedicines = new List<Medicine>();

            foreach (Medicine selectedMedicine in dgMedicine.SelectedItems)
            {
                selectedMedicines.Add(selectedMedicine);
            }

            OrderBasketWindow ob = new OrderBasketWindow(selectedMedicines);
            ob.Show();*/


        }
    }
}
