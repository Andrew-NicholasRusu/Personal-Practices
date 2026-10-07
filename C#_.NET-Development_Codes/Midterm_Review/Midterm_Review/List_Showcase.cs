using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;

namespace Midterm_Review
{
    static void Main(String[] args)
    { 
        List<int> numbers = [1, 2, 3, 4];
        List<string> strings = ["Piyush", "Silvia", "Sue"];
        List<object> objects = ["Tim", 4, 3.6];

        Stopwatch sw = new();
        sw.Start();
        for (int i = 0; i < 1_000_000; i++) 
        {
            objects.Add(i);
        }
        sw.Stop();
        Console.WriteLine($"List<object> elapsed time: {sw.ElapsedMilliseconds}");

        sw = new();
        sw.Start();

        for (int i = 0; i < 1_000_000; i++)
        {
            numbers.Add(i);
        }
        sw.Stop();
        Console.WriteLine($"List<int> elapsed time: {sw.ElapsedMilliseconds}");
    }
}
