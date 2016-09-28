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
using System.Windows.Shapes;
using DataAccessLayer.Services;


namespace WPFToysForBoys.View
{
    /// <summary>
    /// Interaction logic for ShipmentStatWindow.xaml
    /// </summary>
    public partial class ShipmentStatWindow : Window
    {
        public ShipmentStatWindow()
        {
            InitializeComponent();
        }

        private void ButtonSearch_Click(object sender, RoutedEventArgs e)
        {
            var service = new ShippingService();
            try
            {
                //order properties invullen 
                var shipping = service.GetShippingDetails((int.Parse(TextBoxOrderId.Text)));
                textBlockOrderDate.Text = shipping.OrderDate.ToString();
                textBlockRequiredDate.Text = shipping.RequiredDate.ToString();
                textBlockShipDate.Text = shipping.ShippedDate.ToString();
                textBlockComments.Text = shipping.OrderComments;
                textBlockStatus.Text = shipping.OrderStatus;
                //customer invullen
                textBlockName.Text = shipping.CustomerName;
                textBlockStreet.Text = shipping.Street;
                textBlockPostalCode.Text = shipping.PostalCode;
                textBlockCity.Text = shipping.City;
                textBlockState.Text = shipping.State;
                textBlockCountry.Text = shipping.Country;
                //orderdetails invullen

                ListBoxOrderdetails.DataContext = shipping.OrderDetails;

            }
            catch (Exception)
            {

                MessageBox.Show("Invalid orderID");
            }
            
        }
    }
}
