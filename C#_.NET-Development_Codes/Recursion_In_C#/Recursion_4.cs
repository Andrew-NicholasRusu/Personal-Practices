using System;

/** 4. Write a program in C# Sharp to display the individual digits of a given number using recursion. */

// Test Data :
// Input any number : 1234
// Expected Output :
// The digits in the number 1234 are : 1 2 3 4

namespace Recursion_In_C_
{
    public class Recursion_4
    {
        // Main method, the entry point of the program
        static void Main()
        {
            // Display a description of the program
            Console.Write("\n\n Recursion : Display the individual digits of a given number :\n");
            Console.Write("------------------------------------------------------------------\n");
            Console.Write(" Input any number : ");
            int num = Convert.ToInt32(Console.ReadLine()); // Read user input for the number

            // Display the message indicating the digits in the entered number
            Console.Write(" The digits in the number {0} are : ", num);

            // Call a recursive function to separate and display the individual digits of the entered number
            separateDigits(num);
            Console.Write("\n\n");
        }

        // Recursive function to separate and display individual digits of a number
        static void separateDigits(int n)
        {
            // Base case: if the number has only one digit
            if (n < 10)
            {
                Console.Write("{10}   ", n); // Display the single digit
                return;
            }

            // Recursive call: separateDigits method is called for the quotient of the number divided by 10
            separateDigits(n / 10);
            Console.Write(" {0} ", n % 10); // Display the remainder (last digit)
        }
    }
}
