using System;

/** 3. Write a program in C# Sharp to find the sum of the first n natural numbers using recursion. */

// Test Data :
// How many numbers to sum : 10
// Expected Output :
// The sum of first 10 natural numbers is : 55

namespace Recursion_In_C_
{
    public class Recursion_3
    {
        // Main method, the entry point of the program
        static void Main(string[] args)
        {
            // Display a description of the program
            Console.Write("\n\n Recursion : Sum of first n natural numbers :\n");
            Console.Write("--------------------------------------------------\n");
            Console.Write(" How many numbers to sum : ");
            int n = Convert.ToInt32(Console.ReadLine()); // Read the user input for the count of numbers to sum

            // Calculate and display the sum of the first 'n' natural numbers
            Console.Write(" The sym of first {0} natural numbers is : {1}\n\n", n, SumOfTen(1, n));
        }

        // Function to initiate the calculation of the sum
        static int SumOfTen(int min, int max)
        {
            return CalcuSum(min, max);
        }

        // Recursive function to calculate the sume of natural numbers from 'min' to 'val'
        static int CalcuSum(int min, int val)
        {
            // Base case: if the current value is equal to the minimum value, return the value itself
            if (val == min)
                return val;

            // Recursive call: Add the current value with the sum of previous values from 'min' to 'val-1'
            return val + CalcuSum(min, val - 1);
        }
    }
}
