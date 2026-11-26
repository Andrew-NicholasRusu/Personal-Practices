using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace EverythingShown_InClass
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        List<TodoItem> items = new List<TodoItem>
        {
            new TodoItem { Title = "Databases with an Intro to SQL", Completion = 20 },
            new TodoItem { Title = ".NET Development", Completion = 20 },
            new TodoItem { Title = "Managing and Maintaining Computers", Completion = 20 },
            new TodoItem { Title = "Internet of Things", Completion = 20 },
            new TodoItem { Title = "Introduction to PHP", Completion = 20 },
            new TodoItem { Title = "Backend Development", Completion = 20 },
            new TodoItem { Title = "System Analysis", Completion = 20 },
            new TodoItem { Title = "Networking and Security", Completion = 20 },
        }


    }
}