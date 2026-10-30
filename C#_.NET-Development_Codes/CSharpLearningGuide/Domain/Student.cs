namespace CSharpLearningGuide.Domain;

public sealed class Student
{
    private readonly List<int> _scores;

    public Student(string name, IEnumerable<int> scores)
    {
        ArgumentException.ThrowIfNullOrWhiteSpace(name);
        ArgumentNullException.ThrowIfNull(scores);

        _scores = scores.ToList();
        if (_scores.Count == 0)
        {
            throw new ArgumentException("At least one score is required.", nameof(scores));
        }

        if (_scores.Any(score => score is < 0 or > 100))
        {
            throw new ArgumentException("Scores must be from 0 to 100.", nameof(scores));
        }

        Name = name;
    }

    public string Name { get; }

    public IReadOnlyList<int> Scores => _scores;

    public int ScoreCount => _scores.Count;

    public double Average => _scores.Average();
}
