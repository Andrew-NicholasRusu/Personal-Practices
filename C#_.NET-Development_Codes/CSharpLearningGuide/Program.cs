using CSharpLearningGuide.Application;
using CSharpLearningGuide.Presentation;

var performanceLevelService = new PerformanceLevelService();
var scoreTrackerService = new ScoreTrackerService(performanceLevelService);
var consoleScoreTracker = new ConsoleScoreTracker(scoreTrackerService);

consoleScoreTracker.Run();
