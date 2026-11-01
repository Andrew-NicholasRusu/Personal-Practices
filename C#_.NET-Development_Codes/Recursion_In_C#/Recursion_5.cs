using System;

/** 5.Write a program in C# Sharp to count the number of digits in a number using recursion. */
// Test Data :
// Input any number : 12345
// Expected Output :
// The number 12345 contains number of digits : 5

namespace Recursion_In_C_
{
    public class Recursion_5
    {
        static void Main(string[] args)
        {
            // Display a description of the program
            Console.Write("\n\n Recursion : Count the number of digits in a number :\n");
            Console.Write("---------------------------------------------------------\n");
            Console.Write(" Input any number : ");
            int num = Convert.ToInt32(Console.ReadLine()); // Read user input for the number

            // Display the number of digits in the entered number
            Console.Write("\n The number {0} contains number of digits: {1} ", num, getDigits(num, 0));
            Console.ReadLine();
        }

        // Recursive function to count the number of digits in a number
        public static int getDigits(int n1, int noDigits)
        {
            // Base case: if the number becomes zero, return the count of digits
            if (n1 == 0)
                return noDigits;

            // Recursive call: getDigits method is called with the quotient of the number divided by 10 and the incremented count of digits
            return getDigits(n1 / 10, ++noDigits);
        }
    }
}
