"""Before retrieving records, create a database and insert a few sample records. 
The following example creates a students table and adds three records."""

import sqlite3

connection = sqlite3.connect("students.db")
cursor = connection.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    score INTEGER NOT NULL
)
""")
cursor.execute("DELETE FROM students")

cursor.executemany(
    "INSERT INTO students (name, score) VALUES (?, ?)",
    [
        ("Aman", 85),
        ("Priya", 92),
        ("Rahul", 78)
    ]
)
connection.commit()
connection.close()

###### Ways to Select Data in Tables ######

# 1. Reading All Rows Using fetchall()
"""This method retrieves all remaining rows from the query result and returns them as a list. 
Each row is represented by a tuple by default."""
import sqlite3

connection = sqlite3.connect("students.db")
cursor = connection.cursor()

cursor.execute("SELECT * FROM students ORDER BY id")
rows = cursor.fetchall()

for row in rows:
    print(row)
connection.close()

# 2. Selecting Specific Columns
"""To retrieve only the required fields, specify their names instead of using an asterisk."""
import sqlite3

connection = sqlite3.connect("students.db")
cursor = connection.cursor()

cursor.execute("SELECT name, score FROM students ORDER BY id")

for row in cursor:
    print(row)
connection.close()

# 3. Reading Limited Number of Rows Using fetchmany()
"""This method retrieves the next specified number of rows from the result set. 
It returns a list containing up to the requested number of records."""
import sqlite3

connection = sqlite3.connect("students.db")
cursor = connection.cursor()

cursor.execute("SELECT * FROM students ORDER BY id")

rows = cursor.fetchmany(2)

for row in rows:
    print(row)
connection.close()

# 4. Reading One Row Using fetchone()
"""It retrieves the next available row from the result set. 
It returns a tuple by default, or None when no rows remain."""
import sqlite3

connection = sqlite3.connect("students.db")
cursor = connection.cursor()

cursor.execute("SELECT * FROM students ORDER BY id")

row = cursor.fetchone()
print(row)
connection.close()

# 5. Filtering, Sorting and Limiting Results
"""SELECT can be combined with other SQL clauses to retrieve specific records. 
These clauses should be discussed briefly here because separate GeeksforGeeks articles cover them in detail."""
import sqlite3

connection = sqlite3.connect("students.db")
cursor = connection.cursor()

minimum_score = 85

cursor.execute (
    """
    SELECT name, score 
    FROM students
    WHERE score >= ?
    ORDER BY score DESC
    LIMIT 3
    """,
    (minimum_score,)
)

for row in cursor:
    print(row)
connection.close()