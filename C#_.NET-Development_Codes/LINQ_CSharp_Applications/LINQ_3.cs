using System;
using System.Collections.Generic;
using System.Text;
using static System.Runtime.InteropServices.JavaScript.JSType;

/* 3.Write a program in C# Sharp to find the number of an array and the square of each number. */
// Expected Output :
// { Number = 9, SqrNo = 81 }
// { Number = 8, SqrNo = 64 }
// { Number = 6, SqrNo = 36 }
// { Number = 5, SqrNo = 25 }

namespace LINQ_CSharp_Applications
{
    public class LINQ_3
    {
        static void Main(string[] args)
        {
            // Define an integer array
            var arr1 = new[] { 3, 9, 2, 8, 6, 5 };

            // Display a message indicating the purpose of the LINQ operation.
            Console.Write("\nLINQ : Find the number and its square of an array which is more than 20 : ");
            Console.Write("\n------------------------------------------------------------------------\n");

            // Create a LINQ query to find numbers and their squares greater than 20
            var sqNo = from int Number in arr1
                       let SqrNo = Number * Number
                       where SqrNo > 20
                       select new { Number, SqrNo };

            // Iterate through the result and disolay numbers and their squares
            foreach (var a in sqNo)
                Console.WriteLine(a);

            Console.ReadLine(); // Wait for user input before closing the program.
        }
    }
}
