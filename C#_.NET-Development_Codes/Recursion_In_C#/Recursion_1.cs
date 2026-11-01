using System;

/** 1. Write a program in C# Sharp to print the first n natural numbers using recursion */

// Test Data :
// How many numbers to print : 10
//  Expected Output :
//1 2 3 4 5 6 7 8 9 10

namespace Recursion_In_C_
{
    public class Recursion_1
    {
        // Recursive method to print the first 'ctr' natural numbers starting from 'stval'
        static int printNatural(int stval, int ctr)
        {
            // Base case: If the counter becomes less than 1, return the starting value
            if (ctr < 1)
            {
                return stval;
            }
            ctr--; // Decrement the counter
            Console.Write(" {0} ", stval); // Print the current value
                                           // Recursive call Increment 'stval' and decrement 'ctr' to print the next natural number
            return printNatural(stval + 1, ctr);
        }

        // Main method, the entry point of the program
        static void Main()
        {
            // Display a description of the program 
            Console.Write("\n\n Recursion : Print the first n natural number :\n");
            Console.Write("---------------------------------------------------\n");
            Console.Write(" How many numbers to print : ");

            int ctr = Convert.ToInt32(Console.ReadLine()); // Read the user input for the count of numbers

            // Call the recursive method to print the first 'ctr' natural numbers starting from 1
            printNatural(1, ctr);
            Console.Write("\n\n");
        }
    }
}