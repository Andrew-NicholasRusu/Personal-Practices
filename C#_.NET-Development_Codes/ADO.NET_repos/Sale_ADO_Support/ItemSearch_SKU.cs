using System;
using System.Data.SqlClient;

namespace Sale_ADO_Support
{
    public class ItemSearch_SKU
    {
        public void main(String[] args)
        {
            Console.Write("Enter SKU: ");

            if (!int.TryParse(Console.ReadLine(), out int sku))
            {
                Console.WriteLine("Invalid SKU.");
                return;
            }
            using (SqlConnection connection = 
                    new SqlConnection(connectionString))
            {
                string query =
                    "SELECT SKU, Name, Price " +
                    "FROM Item WHERE SKU = @SKU";

                using (SqlCommand command =
                    new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SKU", sku);
                    connection.Open();

                    using (SqlDataReader reader =
                            command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Console.WriteLine(
                                $"{reader["SKU"]} - " +
                                $"{reader["Name"]} - " +
                                $"{reader["Price"]}");
                        }
                        else
                        {
                            Console.WriteLine("SKU does not exist.");
                        }
                    }
                }
            }
        }
    }
}
