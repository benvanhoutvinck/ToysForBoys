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

namespace WPFToysForBoys.View
{
    /// <summary>
    /// Interaction logic for ToysForBoysWindows.xaml
    /// </summary>
    public partial class ToysForBoysWindows : Window
    {
        public ToysForBoysWindows()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            View.ProductsWindow view = new ProductsWindow();
            view.Show();
            Application.Current.MainWindow.Close();
        }
    }
}
