using System;
using System.Collections.Generic;
using System.Text;

/* 2.Write a program in C# Sharp to find the +ve numbers from a list of numbers using two where conditions in LINQ Query. */
// Expected Output:
// The numbers within the range of 1 to 11 are :
// 1 3 6 9 10

namespace LINQ_CSharp_Applications
{
    public class LINQ_2
    {
        static void Main()
        {
            // Define an integer array
            int[] n1 =
            {
                1, 3, -2, -4, -7, -3, -8, 12, 19, 6, 9, 10, 14
            };

            // Display a message indicating the purpose of the LINQ operation
            Console.Write("\nLINQ : Using multiple WHERE clause to find the positive numbers within the list : ");
            Console.Write("\n-----------------------------------------------------------------------------");

            // Define a LINQ query using multiple 'where' clauses to filter numbers within a specific range
            var nQuery =
                from VrNum in n1
                where VrNum > 0 // Filter numbers greater than 0 
                where VrNum < 12 // Further filter numbers less than 12
                select VrNum;

            // Display the selected numbers that satisfy the conditions
            Console.Write("\nThe numbers within the range of 1 to 11 are : \n");
            foreach(var VrNum in nQuery)
            {
                Console.Write("{0} ", VrNum);
            }

            Console.Write("\n\n"); // Add newline for formatting
        }
    }
}
