using System;
using System.Collections.Generic;
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

namespace Diplom_Hospital.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrderPage.xaml
    /// </summary>
    public partial class OrderPage : Page
    {
        private static Category medical;
        private static List<Medicine> medicines;
        public OrderPage()
        {
            InitializeComponent();
            cbCategory.ItemsSource = MedicinaEntities.GetContext().Category.ToList();
            cbCategory.SelectedIndex = 0;
            medicines = MedicinaEntities.GetContext().Medicine.ToList();
            dgMedicine.ItemsSource = medicines;

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

        private void btnMakeOrder_Click(object sender, RoutedEventArgs e)
        {
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
        }
    }
}
