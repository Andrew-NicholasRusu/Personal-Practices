using System;
using System.Collections.Generic;
using System.Text;

namespace Midterm_Review
{
    internal class Amazon_Boxing
    {
        static void Main(string[] args)
        {
            int productAmount = 70;
            double productPrice = 89.99;
            string productName = "Arduino Starter Kit";
            int shippingDays = 5;
            string AmazonUsername = "Andrew-Nicholas Rusu"; 
            string AmazonPassword = "am@z0nENTERpls20==5798$"; // NOT A REAL PASSWORD
            bool amazonPrimeSubscription = false;

            // String Interpolation showcase:
            Console.WriteLine($"Product Amount: {productAmount}");
            Console.WriteLine($"Price: {productPrice}");
            Console.WriteLine($"Name: {productName}");
            Console.WriteLine($"Number of days to be shipped: {shippingDays}");
            Console.WriteLine($"Amazon Username: {AmazonUsername}");
            Console.WriteLine($"User's Password: {AmazonPassword}");
            Console.WriteLine($"User has Prime subscription? {amazonPrimeSubscription}");

            object boxedProduct = productName; // Boxing
            Console.WriteLine($"This {productName} will be shipped in {shippingDays} days.");

            int openedProduct = (int)boxedProduct; // Unboxing
            Console.WriteLine($"{AmazonUsername} has gotten their product: {openedProduct}"); 
        }
    }
}
