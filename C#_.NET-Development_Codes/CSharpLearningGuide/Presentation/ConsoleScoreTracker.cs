using CSharpLearningGuide.Application;

namespace CSharpLearningGuide.Presentation;

public sealed class ConsoleScoreTracker
{
    private readonly ScoreTrackerService _scoreTrackerService;

    public ConsoleScoreTracker(ScoreTrackerService scoreTrackerService)
    {
        ArgumentNullException.ThrowIfNull(scoreTrackerService);
        _scoreTrackerService = scoreTrackerService;
    }

    public void Run()
    {
        Console.WriteLine("=== Student Score Tracker ===");
        string studentName = ReadStudentName();
        Console.WriteLine($"Hi, {studentName}! Enter up to 3 scores from 0 to 100.");

        List<int> scores = ReadScores();
        if (scores.Count == 0)
        {
            Console.WriteLine("No scores were entered, so there is nothing to summarize.");
            return;
        }

        var student = _scoreTrackerService.CreateStudent(studentName, scores);
        Console.WriteLine(_scoreTrackerService.CreateSummary(student));
    }

    private static string ReadStudentName()
    {
        Console.Write("Enter your name: ");
        string studentName = (Console.ReadLine() ?? string.Empty).Trim();
        return string.IsNullOrWhiteSpace(studentName) ? "Student" : studentName;
    }

    private List<int> ReadScores()
    {
        var scores = new List<int>();

        for (int attempt = 1; attempt <= 3; attempt++)
        {
            Console.Write($"Score {attempt} (or press Enter to finish): ");
            string? input = Console.ReadLine();

            if (string.IsNullOrWhiteSpace(input))
            {
                break;
            }

            if (int.TryParse(input, out int score) && _scoreTrackerService.IsValidScore(score))
            {
                scores.Add(score);
            }
            else
            {
                Console.WriteLine("Please enter a whole number from 0 to 100.");
                attempt--;
            }
        }

        return scores;
    }
}
