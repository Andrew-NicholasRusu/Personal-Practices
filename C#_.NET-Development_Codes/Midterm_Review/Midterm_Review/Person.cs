using Midterm_Review;
using System;
using System.Collections.Generic;
using System.Text;

Console.WriteLine($"Program started with {args.Length} arguments.");
Person student = new Person("Alex", 20);
student.DisplayInfo();

namespace Midterm_Review
{
    internal class Person
    {
        public string Name {
            get;
            set;
        }
        public int Age
        {
            get;
            set;
        }

        public Person(string name, int age)
        {
            Name = name;
            Age = age;
        }
        public void DisplayInfo()
        {
            Console.WriteLine($"Student Name: {Name}, Age: {Age}");
        }
    }
}
