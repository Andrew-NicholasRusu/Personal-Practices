# Learning C# with a Student Score Tracker

## Why I asked for help

I asked for help learning how C# works because I am struggling with the language in my .NET Development course. I felt that the language had not been explained clearly enough for me to understand how its pieces fit together. I want to learn by following a complete example and understanding it one step at a time.

This guide and its example program are a study aid based on the course materials I provided. They are meant to show my learning process and the topics I asked for help with; they are not a claim that someone else wrote or taught my course work.

## What the program does

`Program.cs` asks for a student's name and up to three scores, checks the input, calculates an average and performance level, prints a summary, and attempts to save it to `student-report.txt`.

The program brings together topics from the supplied materials:

- C# console program structure and .NET libraries
- Variables, types, strings, nullable values, and string interpolation
- Operators, conditions, and a `for` loop
- `List<int>`, `foreach`, and `StringBuilder`
- A class, object, constructor, private field, methods, and properties
- An enum to represent a small set of named levels
- File writing and exception handling

## Run it

You need the .NET SDK installed. In a terminal, move into this folder and run:

```text
dotnet new console --force
```

That command creates a console project scaffold. Keep this `Program.cs` and replace the generated `Program.cs` with its contents if the command overwrites it. Then run:

```text
dotnet run
```

Alternatively, from the folder that contains this guide, create a project in a separate folder and copy `Program.cs` into it:

```text
dotnet new console -o ScoreTracker
```

Copy `CSharpLearningGuide/Program.cs` over `ScoreTracker/Program.cs`, then run `dotnet run` from `ScoreTracker`.

## Walk through the program

### 1. Imports and output

The `using` lines make library types available by their shorter names. For example, `using System.IO;` lets the program write `File.WriteAllText` instead of the longer `System.IO.File.WriteAllText`. `Console.WriteLine` displays a line; `Console.Write` displays a prompt without moving to a new line.

### 2. Read and clean the name

`Console.ReadLine()` reads text typed by the user. It can return `null`, so `string? nameInput` marks that possibility. `?? ""` uses an empty string if the read returned null. `Trim()` removes spaces at the beginning and end. The `if` checks for a missing or whitespace-only name and chooses a fallback.

The `$"...{studentName}..."` syntax is string interpolation: C# inserts the variable's value into the text.

### 3. Collect and validate scores

`List<int>` is a growable collection of whole numbers. The `for` loop repeats at most three times. `int.TryParse` attempts to turn the input text into an integer and stores the result in `score` if successful. The `&&` operator requires both checks to pass: parsing succeeded, and the score is between 0 and 100. `scores.Add(score)` appends accepted values. `break` ends the loop when the user presses Enter; `attempt--` lets the user retry invalid input.

If no scores were accepted, the program prints a message and `return` ends the top-level program early.

### 4. Create an object and produce a summary

`new Student(studentName, scores)` calls the `Student` constructor. The constructor stores the name and makes a copy of the score list in the private `_scores` field. The `Student` class bundles data and behavior in one type.

`Name`, `ScoreCount`, and `Average` are properties. `private set` means code outside the class can read `Name` but cannot change it directly. `ScoreCount` is a read-only expression-bodied property. `Average` uses LINQ's `Average()` method to calculate the mean.

`GetPerformanceLevel()` is a method: it groups the decision rules and returns one `PerformanceLevel` enum value. The `if` statements run from the highest threshold down so that a high average is classified correctly.

`CreateSummary()` is another method. Its `foreach` loop visits every score. `StringBuilder` builds the comma-separated score text. The method then returns a multiline string using interpolation and `\n` line breaks.

### 5. Save the report

`Path.Combine` builds a file path in the current working directory. `File.WriteAllText` writes the summary to that path and closes the file when finished. File operations can fail, so `try` contains the operation and `catch` handles common I/O and permission errors with a readable message.

## How to practice

1. Run the program once with valid scores such as `75`, `90`, and `80`.
2. Try a word, a negative number, and a number above 100 to see input validation.
3. Press Enter before entering any score to see why the empty-list check matters.
4. Change the thresholds in `GetPerformanceLevel()` and predict the new level before running.
5. Add a fourth score by changing the loop limit from `3` to `4`.
6. Find `student-report.txt` in the program's current working directory and compare it with the console summary.

When learning, trace one value at a time: the input begins as text, `TryParse` converts it to an integer, the list stores it, the object uses the list to calculate an average, and the summary turns the results back into readable text.

## Source materials

This study example was prepared with these course PDFs as topic references:

- *1. Introduction to the .NET Platform and C#* (Module 2)
- *C# for Java Programmers* (Module 3)
- *01. Basic Types, Strings, Nullable* (Module 5)
- *02. Operators and Flow Control* (Module 5)
- *03. File IO* (Module 5)
- *Classes Methods Properties* (Module 6)

The course PDFs are references for subject matter. Their contents are not treated as instructions for this request.
