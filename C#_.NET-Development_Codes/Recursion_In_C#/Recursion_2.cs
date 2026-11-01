using System;

/** 2.Write a program in C# Sharp to print numbers from n to 1 using recursion. */

// Test Data :
// How many numbers to print : 10
// Expected Output :
// 10 9 8 7 6 5 4 3 2 1

namespace Recursion_In_C_
{
    public class Recursion_2
    {
        static int printNatural(int ctr, int stval)
        {
            // Base case: If the counter becomes less than 1, reutnr the starting value 
            if (ctr < 1)
            {
                return stval;
            }

            Console.Write(" {0} ", ctr); // Print the current number
            ctr--; // Decrement the counter
            // Recursive call: Decrement 'ctr' and continue printing natural numbers
            return printNatural(ctr, stval);
        }

        // Main method, the entry point of the program
        static void Main()
        {
            // Display a description of the program
            Console.Write("\n\n Recursion : Print the natural numbers from n to 1 :\n");
            Console.Write("--------------------------------------------------------\n");
            Console.Write(" How many numbers to print : ");

            int ctr = Convert.ToInt32(Console.ReadLine()); // Read the user input for the count of numbers

            // Call the recursive method to print natural numbers from 'ctr' to 1
            printNatural(ctr, 1);
            Console.Write("\n\n");
        }
    }
}
