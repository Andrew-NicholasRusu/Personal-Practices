using System;
using System.Collections.Generic;
using System.Text;

namespace CSharpLearningGuide
{
    public class Student
    {
        private readonly List<int> _scores;

        public string Name
        {
            get;
            private set;
        }
        public int ScoreCount => _scores.Count; // expression-bodied, read-only property
        public double Average => _scores.Average();

        public Student(string name, List<int> scores)
        {
            Name = name;
            _scores = new List<int>(scores); // make this object's own copy
        }
    }
}
