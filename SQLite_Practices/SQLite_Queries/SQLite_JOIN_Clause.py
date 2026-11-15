"""JOIN clause in SQLite combines rows from two or more tables using a related column or a specified condition. 
Python's built-in sqlite3 module allows us to execute these queries and retrieve the combined results."""

# 1. Connect to SQLite and Create Tables
import sqlite3

connection = sqlite3.connect(":memory:")
cursor = connection.cursor()

cursor.executescript("""
CREATE TABLE Advisor (
    AdvisorID INTEGER PRIMARY KEY,
    AdvisorName TEXT NOT NULL
);

CREATE TABLE Student (
    StudentID INTEGER PRIMARY KEY,
    StudentName TEXT NOT NULL,
    AdvisorID INTEGER,
    FOREIGN KEY (AdvisorID)
        REFERENCES Advisor(AdvisorID)
);
""")

# 2. Inserting Sample Records
advisors = [
    (1, "John Paul"),
    (2, "Anthony Roy"),
    (3, "Raj Shetty"),
    (4, "Sam Reeds"),
    (5, "Arthur Clintwood")
]

students = [
    (501, "Student1", 1),
    (502, "Student2", 1),
    (503, "Student3", 3),
    (504, "Student4", 2),
    (505, "Student5", 4),
    (506, "Student6", 2),
    (507, "Student7", 2),
    (508, "Student8", 3),
    (509, "Student9", None),
    (510, "Student10", 1)
]

cursor.executemany(
    "INSERT INTO Advisor VALUES (?, ?)",
    advisors
)

cursor.executemany(
    "INSERT INTO student VALUES (?, ?, ?)",
    students
)

# 3. Creating Function to Display Results
"""We will use the following function to execute each JOIN query and print its results."""
def run_query(query):
    cursor.execute(query)

    for row in cursor.fetchall():
        print(row)


## INNER JOIN 
"""It returns only rows that satisfy the matching condition in both tables. Records without a corresponding match are excluded."""

run_query("""
SELECT s.StudentID, s.StudentName, a.AdvisorName
FROM Student AS s
INNER JOIN Advisor AS a
ON s.AdvisorID = a.AdvisorID
ORDER BY s.StudentID;
""")

## LEFT JOIN
"""It returns every row from the left table and matching rows from the right table. 
When a match does not exist, the right-side columns contain NULL values."""

run_query("""
SELECT s.StudentID, s.StudentName, a.AdvisorName
FROM Student As s
LEFT JOIN Advisor AS a
ON s.AdvisorID = a.AdvisorID
ORDER BY s.StudentID;
""")

## RIGHT JOIN
"""It returns every row from the right table and matching rows from the left table. 
If no corresponding left-side record exists, its columns contain NULL values."""

run_query("""
SELECT s.StudentID, s.StudentName, a.AdvisorName
FROM Student AS s
RIGHT JOIN Advisor AS a
ON s.AdvisorID = a.AdvisorID
ORDER BY a.AdvisorID, s.StudentID;
""")

## FULL OUTER JOIN
"""Returns all matching rows along with unmatched rows from both tables. 
Missing values on either side are represented by NULL."""

run_query("""
SELECT s.StudentID, s.StudentName, a.AdvisorName
FROM Student AS s
FULL OUTER JOIN Advisor AS a
ON s.AdvisorID = a.AdvisorID
ORDER BY COALESCE(s.AdvisorID, a.AdvisorID, 999),
        s.StudentID;
""")

## CROSS JOIN 
"""It returns the Cartesian product of two tables. Every row from the first table is combined 
with every row from the second table, regardless of whether their values match."""

run_query("""
SELECT s.StudentName, a.AdvisorName
FROM Student AS s
CROSS JOIN Advisor AS a
ORDER BY s.StudentID, a.AdvisorID
LIMIT 5;
""")

## Using ON and USING in JOIN Queries

run_query("""
SELECT StudentName, AdvisorName
FROM Student
INNER JOIN Advisor
USING (AdvisorID)
ORDER BY StudentID;
""")

# Explanation:
    # USING (AdvisorID) matches rows by the column shared by both tables.
    # It can replace ON Student.AdvisorID = Advisor.AdvisorID in this example.
    # USING is appropriate when the common column name represents the intended relationship.

conn.commit()

conn.close()

