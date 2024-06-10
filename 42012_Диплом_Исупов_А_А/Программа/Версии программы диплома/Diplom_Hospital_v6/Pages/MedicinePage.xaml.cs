using Diplom_Hospital.Classes;
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
using static System.Net.Mime.MediaTypeNames;
using Diplom_Hospital.Model;

namespace Diplom_Hospital.Pages
{
    /// <summary>
    /// Логика взаимодействия для MedicinePage.xaml
    /// </summary>
    public partial class MedicinePage : Page
    {
        public MedicinePage()
        {
            InitializeComponent();
            dgMedicine.ItemsSource = MedicinaEntities.GetContext().Balance.ToList();
        }

        private void btnEditPage_Click(object sender, RoutedEventArgs e)
        {
            //Manager.MainFrame.Navigate(new EditPage((sender as Button).DataContext as Application));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var applicationsForRemoving = dgMedicine.SelectedItems.Cast<Balance>().ToList();

            try
            {
                MedicinaEntities.GetContext().Balance.RemoveRange(applicationsForRemoving);
                MedicinaEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные удалены!");
                dgMedicine.ItemsSource = MedicinaEntities.GetContext().Balance.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
