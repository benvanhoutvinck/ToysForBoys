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
            userNameTextBox.Text = "User";
            passwordBox.Password = "user";
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            //Regular admin
            if (userNameTextBox.Text.ToString() == "User" && passwordBox.Password.ToString() == "user")
            {
                ViewModel.ManagementVM vm = new ViewModel.ManagementVM(false);
                View.ManagementWindow eenView = new ManagementWindow();
                eenView.DataContext = vm;
                eenView.Show();
                Application.Current.MainWindow.Close();
            }
            //Super admin
            else if (userNameTextBox.Text.ToString() == "Admin" && passwordBox.Password.ToString() == "admin")
            {
                ViewModel.ManagementVM vm = new ViewModel.ManagementVM(true);
                View.ManagementWindow eenView = new ManagementWindow();
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
