using CSharpLearningGuide.Domain;

namespace CSharpLearningGuide.Application;

public sealed class ScoreTrackerService
{
    private readonly PerformanceLevelService _performanceLevelService;

    public ScoreTrackerService(PerformanceLevelService performanceLevelService)
    {
        ArgumentNullException.ThrowIfNull(performanceLevelService);
        _performanceLevelService = performanceLevelService;
    }

    public bool IsValidScore(int score) => score is >= 0 and <= 100;

    public Student CreateStudent(string name, IEnumerable<int> scores)
    {
        return new Student(name, scores);
    }

    public string CreateSummary(Student student)
    {
        ArgumentNullException.ThrowIfNull(student);

        string formattedScores = string.Join(", ", student.Scores);
        PerformanceLevel level = _performanceLevelService.GetLevel(student);

        return $"Student: {student.Name}{Environment.NewLine}" +
               $"Scores: {formattedScores}{Environment.NewLine}" +
               $"Number of scores: {student.ScoreCount}{Environment.NewLine}" +
               $"Average: {student.Average:F1}%{Environment.NewLine}" +
               $"Level: {level}";
    }
}
