using System;

/** 6. Write a program in C to print even or odd numbers in a given range using recursion. */

// Test Data :
// Input the range to print starting from 1 : 20
// Expected Output :

// All even numbers from 1 to 20 are :
// 2 4 6 8 10 12 14 16 18 20 

// All odd numbers from 1 to 20 are :
// 1 3 5 7 9 11 13 15 17 19

namespace Recursion_In_C_
{
    public class Recursion_6
    {
        public static void Main()
        {
            int n;

            // Display a description of the program
            Console.Write("\n\n Recursion : Print even or odd numbers in a given range :\n");
            Console.Write("-------------------------------------------------------------\n");

            // Prompt user to input a range.
            Console.Write(" Input the range to print starting from 1 : ");
            n = Convert.ToInt32(Console.ReadLine());

            // Display even numbers from 1 to n
            Console.WriteLine("\n All even numbers from 1 to {0} are : ", n);
            EvenAndOdd(1, n); // Call the function EvenAndOdd for odd numbers
            Console.WriteLine("\n\n");

            return;
        }

        // Recurive functions to print even or odd numbers in a given range
        static void EvenAndOdd(int stVal, int n)
        {
            // Base case: If starting value exceeds the range, return
            if (stVal > n)
                return;

            // Print the current value (even of odd)
            Console.Write(" {0} ", stVal);

            // Recursive call: Increment stVal by 2 and call EvenAndOdd function
            EvenAndOdd(stVal + 2, n);
        }
    }
}
