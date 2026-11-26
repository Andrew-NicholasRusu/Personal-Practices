using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SalesInventoryApp
{
    internal class Program
    {
        private static string connectionString;
        private static void Main()
        {
            // read the connection string from App.config connetionString = ConfigurationManager
            // .ConnectionStrings["SalesConn"].ConnectionString;

            bool running = true;
            while (running)
            {
                Console.WriteLine();
                Console.WriteLine("=== Sales Inventory ===");
                Console.WriteLine("1. Display all items");
                Console.WriteLine("2. Search item by SKU");
                Console.WriteLine("3. Insert new item");
                Console.WriteLine("4. Update item price");
                Console.WriteLine("5. Delete item by SKU");
                Console.WriteLine("6. Show item count and average price");
                Console.WriteLine("7. Load items into a DataSet");
                Console.WriteLine("0. Exit");
                Console.Write("Choose an option: ");

                string choice = Console.ReadLine();

                // handling SQL Server errors:
                try
                {
                    switch (choice)
                    {
                        case "1":
                            DisplayAllItems();
                            break;
                        case "2":
                            SearchBySku();
                            break;
                        case "3":
                            InsertItem();
                            break;
                        case "4":
                            UpdatePrice();
                            break;
                        case "5":
                            DeleteItem();
                            break;
                        case "6":
                            ShowStatistics();
                            break;
                        case "7":
                            LoadIntoDataSet();
                            break;
                        case "0":
                            running = false;
                            break;
                        default:
                            Console.WriteLine("Invalid option.");
                            break;
                    }
                }
                catch (SqlException ex)
                {
                    Console.WriteLine($"Database error {ex.Message}");
                }
            }
        }

        // SqlDataReader (connected access)
        private static void DisplayAllItems()
        {
            string query = "SELECT SKU, Name, Price FROM Item ORDER BY SKU";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Console.WriteLine(
                            $"{reader.GetInt32(0)} | {reader.GetString(1),-15} | {reader.GetDecimal(2),8:F2}");
                    }
                }
            }
        }

        // Parameterized query:
        private static void SearchBySku()
        {
            if (!TryReadInt("Enter SKU: ", out int sku)) return;

            string query = "SELECT SKU, Name, Price FROM Item WHERE SKU = @SKU";

            using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.Add("@SKU", SqlDbType.Int).Value = sku;

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Console.WriteLine(
                            $"{reader.GetInt32(0)} - {reader.GetString(1)} - {reader.GetDecimal(2):F2}");
                    }
                    else
                    {
                        Console.WriteLine("SKU does not exist.");
                    }
                }
            }
        }

        // INSERT + SCOPE_IDENTITY()
        private static void InsertItem()
        {

        }
    }
}