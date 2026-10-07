
using System;
using System.Collections.Generic;
using System.Text;

namespace Midterm_Review
{
    internal class Math_Time
    {
        static void Main(String[] args)
        {
            /** This class uses arithmetic operators */

            // integer artihmetic
            int x = 50;
            int y = 20;

            int result1 = x + y; // 70
            int result2 = x - y; // 30
            int result3 = x * y; // 1000
            int result4 = x / y;
            int result5 = x % y;
            int result6 = -y + x;
            int result7 = --y;
            int result8 = ++x;

            // decimal arithmetic
            decimal a = 8.5m;
            decimal b = 3.4m;

            decimal result11 = a + b;
            decimal result12 = a - b;
            decimal result13 = a / b;
            decimal result14 = a * b;
            decimal result15 = a % b;
            decimal result16 = -a;
            decimal result17 = --a;
            decimal result18 = ++b;

            Console.WriteLine(result1);
            Console.WriteLine(result2);
            Console.WriteLine(result3);
            Console.WriteLine(result4);
            Console.WriteLine(result5);
            Console.WriteLine(result6);
            Console.WriteLine(result7);
            Console.WriteLine(result8);

            Console.WriteLine(result11);
            Console.WriteLine(result12);
            Console.WriteLine(result13);
            Console.WriteLine(result14);
            Console.WriteLine(result15);
            Console.WriteLine(result16);
            Console.WriteLine(result17);
            Console.WriteLine(result18);
        }
    }
}
