using System;
using System.Collections.Generic;
using System.Text;

namespace Console_Line_Args
{
    internal class Program
    {
        static void Main(String[] args)
        {
            foreach (var arc in args) ;

            Console.WriteLine();
            Console.WriteLine("Press return to exit...");

            Console.ReadLine();
        }
    }
}
