using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Diplom_Hospital.Model;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data;
using System.Collections;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Data.SqlClient;
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

        private void btnOrderBasket_Click(object sender, RoutedEventArgs e)
        {
            
            MedicinaEntities _context = MedicinaEntities.GetContext();
            Orders orders = new Orders
            {
                DateOrder = DateTime.Now,
                IdDepartament = LoginWindow.idDepart,
                IdEmployee = LoginWindow.idEmp
            };

            _context.Orders.Add(orders);

            _context.SaveChanges();
            int idOrder = 0;

            using (var connection = new SqlConnection(LoginWindow.connectionString))
            {
                connection.Open();

                var command = new SqlCommand("SELECT MAX(Id) FROM Orders", connection);

                var result = command.ExecuteScalar();

                if (result != DBNull.Value && result != null)
                {
                    idOrder = Convert.ToInt32(result);
                }

                connection.Close();
            }
            MedicinaEntities context = MedicinaEntities.GetContext();
            foreach (Medicine selectedMedicine in dgMedicine.SelectedItems)
            {
                int selectedMedicineId = selectedMedicine.Id;

                OrderDeyails newOrderDetail = new OrderDeyails
                {
                    IdOrder = idOrder,
                    IdMedicine = selectedMedicineId,
                };

                context.OrderDeyails.Add(newOrderDetail);
            }
            context.SaveChanges();

            OrderBasketWindow ob = new OrderBasketWindow(idOrder);
            ob.Show();

            
        }
            private void btnNewPdf_Click(object sender, RoutedEventArgs e)
            {
                try
                {
                BaseFont baseFont = BaseFont.CreateFont("c:\\windows\\fonts\\arial.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
                iTextSharp.text.Font font = new iTextSharp.text.Font(baseFont, iTextSharp.text.Font.DEFAULTSIZE, iTextSharp.text.Font.NORMAL);

                var pdfDoc = new Document(PageSize.LETTER, 40f, 40f, 60f, 60f);
                    string path = $"D:\\Приложения\\42012_Диплом_Исупов_А_А\\Программа\\PdfReport\\report.pdf";
                    PdfWriter.GetInstance(pdfDoc, new FileStream(path, FileMode.OpenOrCreate));
                    pdfDoc.Open();
                string imagePath = "D:/Приложения/42012_Диплом_Исупов_А_А/Программа/LogoDoc/CatCry.jpg";
                
                Paragraph leadparagraph = new Paragraph("ОТЧЕТ О МЕДИКАМЕНТАХ", font);
                leadparagraph.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Add(leadparagraph);

                iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(imagePath);

                image.ScaleToFit(pdfDoc.PageSize.Width/2, pdfDoc.PageSize.Height/2);
                image.Alignment = 1;

                pdfDoc.Add(image);

                var spacer = new iTextSharp.text.Paragraph("")
                    {
                        SpacingBefore = 10f,
                        SpacingAfter = 10f,
                    };
                pdfDoc.Add(spacer);

                Paragraph paragraph = new Paragraph("Медикаменты",font);
                paragraph.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Add(paragraph);
                pdfDoc.Add(spacer);

                PdfPTable table = new PdfPTable(dgMedicine.Columns.Count);
                    foreach (DataGridColumn column in dgMedicine.Columns)
                    {
                        table.AddCell(new Phrase(column.Header.ToString(),font));
                    }

                    // Добавление данных из DataGrid
                    foreach (var item in dgMedicine.Items)
                    {
                        var row = item as Medicine;
                        if (row != null)
                        {
                            table.AddCell(new Phrase(row.Id.ToString()));
                            table.AddCell(new Phrase(row.MedicineName,font));
                            table.AddCell(new Phrase(row.Category.NameCategory,font));
                            table.AddCell(new Phrase(row.Description,font));
                        }
                    }

                    pdfDoc.Add(table);
                    pdfDoc.Close();
                MessageBox.Show("Отчет сохранен по пути:D:\\Приложения\\42012_Диплом_Исупов_А_А\\Программа\\PdfReport");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
