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
using DataAccessLayer;
using System.Xaml;
using System.Windows.Markup;
using System.Globalization;

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
            CultureInfo myCi = new CultureInfo("en-US", false);
            myCi.DateTimeFormat = new DateTimeFormatInfo {  ShortDatePattern="dd/MM/yyyy"};
            CultureInfo.DefaultThreadCurrentCulture = myCi;
            
        }

        private void ButtonSearch_Click(object sender, RoutedEventArgs e)
        {
            var shippingService = new ShippingService();
            var orderService = new OrderService();

            try
            {
                //order properties invullen 
                var shipping = shippingService.GetShippingDetails((int.Parse(TextBoxOrderId.Text)));
                textBlockOrderId.Content = shipping.OrderId.ToString();
                textBlockOrderDate.Content = shipping.OrderDate.ToShortDateString();
                textBlockRequiredDate.Content = shipping.RequiredDate.ToShortDateString();

                
                if (shipping.ShippedDate!=null)
                {
                    var shippedDate = (DateTime)shipping.ShippedDate;
                    textBlockShipDate.Content = shippedDate.ToShortDateString();
                }
                else
                {
                    textBlockShipDate.Content = string.Empty;
                }
               
                textBlockComments.Text = shipping.OrderComments;
                textBlockStatus.Content = shipping.OrderStatus;
                var order = orderService.GetById((int.Parse(TextBoxOrderId.Text)));
                LabelContent.Content = orderService.GetTotalPrice(order).ToString("C");
                
                //customer invullen
                textBlockName.Content = shipping.CustomerName;
                textBlockStreet.Content = shipping.Street;
                textBlockPostalCode.Content = shipping.PostalCode;
                textBlockCity.Content = shipping.City;
                textBlockState.Content = shipping.State;
                textBlockCountry.Content = shipping.Country;
                //orderdetails invullen
                 
                ListBoxOrderdetails.ItemsSource = shipping.OrderDetails;

            }
            catch (Exception)
            {

                MessageBox.Show("Invalid orderID");
            }
            
        }
    }
}
