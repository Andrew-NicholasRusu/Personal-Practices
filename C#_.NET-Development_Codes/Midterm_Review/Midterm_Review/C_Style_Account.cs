using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;

namespace Midterm_Review
{
    internal class C_Style_Account // C# style using getter and setter methods
    {
        private string name;
        public string GetName()
        {
            return name;
        }
        public void SetName(string value)
        {
            name = value;
        }
    }

    // C# Idiomatic Style
    public class CSharpAccount
    {
        // Auto-implemented property
        public string Name
        {
            get;
            set;
        }
        // Property with validation logic
        private decimal balance;
        public decimal Balance
        {
            get
            {
                return balance;
            }
            set
            {
                if (value >= 0)
                {
                    balance = value;
                }
                else
                {
                    Console.WriteLine("Balance cannot be negative.");
                }
            }
        }

        public string GetAccountInfo()
        {
            StringBuilder accountInfo = new StringBuilder(); // StringBuilder example

            accountInfo.AppendLine("Account Information");
            accountInfo.AppendLine("-------------------");
            accountInfo.Append("Name: ");
            accountInfo.Append(Name);
            accountInfo.Append("Balance; $");
            accountInfo.AppendLine(Balance.ToString("F2"));

            return accountInfo.ToString();
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            CSharpAccount account = new CSharpAccount
            {
                Name = "Andrew",
                Balance = 1500.50m
            };

            StringBuilder output = new StringBuilder();

            output.AppendLine("C# Account Demo");
            output.AppendLine("================");
            output.AppendLine(account.GetAccountInfo());

            Console.WriteLine(output.ToString());
        }
    }
}
