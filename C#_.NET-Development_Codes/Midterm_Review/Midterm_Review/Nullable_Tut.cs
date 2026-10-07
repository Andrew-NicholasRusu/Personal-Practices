using System;
using System.Collections.Generic;
using System.Text;

namespace Midterm_Review
{
    internal class Nullable_Tut
    {
        static void FillTheseValues(out int a, out string b, out bool c)
        {
            a = 100;
            b = "Hello";
            c = true;
        }

        static (int, string, bool) ReturnThreeValues(int a, string b, bool c)
        {
            a = 420;
            b = "Salut";
            c = true;

            return (a, b, c);
        }
        // Does not run (lines 9 to 23)

        static int? DataBaseNumericValue()
        {
            int? numericValue = 10;

            return numericValue;
        }

        static void Main(string[] args)
        {
            // null --> Nothing --> No memory reference (empty)

            int? result = DataBaseNumericValue();

            if (result.HasValue)
            {
                Console.WriteLine(result * result);
            }
            else
            {
                Console.WriteLine("The value i");
            }

            string name = null;
            int[] arr = null;

            // cannot convert null to int 
            // int number = null;
            
            int? number = null;
            bool? ok = null;

            Nullable<int> anothernumber = null;
        }
    }
}
