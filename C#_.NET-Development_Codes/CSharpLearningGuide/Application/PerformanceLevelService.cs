using CSharpLearningGuide.Domain;

namespace CSharpLearningGuide.Application;

public sealed class PerformanceLevelService
{
    public PerformanceLevel GetLevel(Student student)
    {
        ArgumentNullException.ThrowIfNull(student);

        return student.Average switch
        {
            >= 80 => PerformanceLevel.Strong,
            >= 50 => PerformanceLevel.Passing,
            _ => PerformanceLevel.NeedsPractice
        };
    }
}
