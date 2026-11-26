using System;
using System.Data.SqlClient;

string connectionString =
    @"Data Source.\SQLEXPRESS;
        Initial Catalog=Sales;
        Integrated Security=True";

string query =
    "SELECT SKU, Name, Price FROM Item";

using (SqlConnection connection =
        new SqlConnection(connectionString))
using (SqlCommand command =
        new SqlCommand(query, connection))
{
    connection.Open();

    using (SqlDataReader reader =
            command.ExecuteReader())
    {
        while (reader.Read())
        {
            Console.WriteLine(
                $"{reader["SKU"]} | " +
                $"{reader["Name]} | " +
                $"{reader["Price"]}");
        }
    }
}

// Calculating the average item price
string query = "SELECT AVG(Price) FROM Item";

using (SqlConnection connection =
        new SqlConnection(connectionString))
            using (SqlCommand command =
                    new SqlCommand(query, connection))
            {
                connection.Open();

                object result = command.ExecutreScalar();

                if (result != null && result != DBNull.Value)
                {
                    decimal average = Convert.ToDecimal(result);

                    Console.WriteLine($"Average price: {average:F2}");
                }
            }
        }
    }
}

                