using System;
using System.Collections.Generic;
using System.Text;

/* 1.Write a program in C# Sharp to show how the three parts of a query operation execute. */

// Expected Output:
// The numbers which produce the remainder 0 after divided by 2 are :
// 0 2 4 6 8

namespace LINQ_CSharp_Applications
{
    public class LINQ_1
    {
        static void Main()
        {
            // The first part is Data source.
            int[] n1 = new int[10] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

            Console.Write("\nBasic structure of LINQ : ");
            Console.Write("\n---------------------------");

            // The second part is Query creation.
            // nQuery is an IEnumerable<int>
            var nQuery =
                from VrNum in n1 // Creating a query expression that retrieves even numbers from the array
                where (VrNum % 2) == 0
                select VrNum;

            // the third part is Query execution.

            Console.Write("\nThe numbers which produce the remainder 0 after divided by 2 are : \n");
            foreach (int VrNum in nQuery) // Loop through the result of the query and display the numbers 
            {
                Console.Write("{0} ", VrNum);
            }
            Console.Write("\n\n");
        }
    }
}
