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
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            //Debug, wordt niet gebruikt in MVVM
            if (userNameTextBox.Text.ToString() == "ABC" && passwordBox.Password.ToString() == "123")
            {
                ViewModel.ManagementVM vm = new ViewModel.ManagementVM();
                View.ManagementWindow eenView = new ManagementWindow(true);
                eenView.DataContext = vm;
                eenView.Show();
                Application.Current.MainWindow.Close();
            }
            else
            {
                MessageBox.Show("Incorrect Login!", "Error", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
            
        }
    }
}
