using System;
using System.Collections.Generic;
using System.Text;

namespace Midterm_Review
{
    /** This program uses reference type semantics*/
    class House // Class (Blueprint)
    {
        public string Color;
        public int Rooms;
        public int Floors;

        // Method to display house details
        public void ShowDetails()
        {
            Console.WriteLine($"Color: {Color}, Rooms: {Rooms}, Floors: {Floors}");
        }
        static void Main()
        {
            // Creating house1 with specific values
            House house1 = new House();
            house1.Color = "Red";
            house1.Rooms = 3;
            house1.Floors = 2;

            // Creating house2 with different values
            House house2 = new House();
            house2.Color = "Blue";
            house2.Rooms = 4;
            house2.Floors = 3;

            // Creating house3 with another set of values
            House house3 = new House();
            house3.Color = "Green";
            house3.Rooms = 5;
            house3.Floors = 1;

            // Displaying details of each house
            Console.WriteLine("House 1 Details:");
            house1.ShowDetails();

            Console.WriteLine("\nHouse 2 Details:");
            house2.ShowDetails();

            Console.WriteLine("\nHouse 3 Details:");
            house3.ShowDetails();

        }
    }
}
