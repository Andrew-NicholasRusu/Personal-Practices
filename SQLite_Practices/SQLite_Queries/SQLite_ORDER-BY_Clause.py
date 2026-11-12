# Creating Table and Inserting Data

"""Let's create a students table containing student names, marks, and city names. 
We will use this table to demonstrate different sorting operations with Python's built-in sqlite3 module."""

import sqlite3
connection = sqlite3.connect(":memory:")

connection.execute("""
    CREATE TABLE students (
        name TEXT NOT NULL,
        marks INTEGER NOT NULL,
        city TEXT NOT NULL
    )
""")

connection.executemany (
    "INSERT INTO students (name, marks, city) VALUES (?, ?, ?)",
    [
        ("Aarav", 85, "Delhi"),
        ("Riya", 92, "Mumbai"),
        ("Kabir", 78, "Delhi"),
        ("Meera", 88, "Pune"),
        ("Ishaan", 81, "Mumbai")
    ]
)

connection.commit()

# Sorting Data In Ascending Order
"""ASC keyword arranges records from the smallest value to the largest. 
For text columns, it generally sorts values alphabetically according to the applicable collation."""

query = """
    SELECT name, marks
    FROM students
    ORDER BY marks ASC 
"""

for row in connection.execute(query):
    print(row)

# Sorting Data is Descending Order
"""DESC to arrange records from the largest value to the smallest. This is useful when displaying high scores, 
expensive products, or the latest values first when sorting a suitable date column."""

query = """
    SELECT name, marks
    FROM students
    ORDER BY marks DESC
"""

for row in connection.execute(query):
    print(row)

# Sorting Multiple Columns
"""It can contain multiple sorting expressions. SQLite sorts by the 
first expression and uses subsequent expressions to resolve ties or organize records within each group."""

query = """
    SELECT name, city, marks
    FROM students
    ORDER BY city ASC, marks DESC
"""

for row in connection.execute(query):
    print(row)
print() # Space

# Combining WHERE and ORDER BY
"""WHERE clause filters records according to a condition, while ORDER BY sorts the matching results. 
Use WHERE before ORDER BY in the SQL statement."""

query = """
    SELECT name, marks
    FROM students
    WHERE marks >= 85
    ORDER BY marks DESC
"""

for row in connection.execute(query):
    print(row)

# Using ORDER BY with LIMIT
"""It restricts the number of rows returned. Combining it with ORDER BY is useful when 
retrieving the top-scoring students or a fixed number of records from a larger dataset."""

query = """
    SELECT name, marks
    FROM students
    ORDER BY marks DESC
    LIMIT 3
"""

for row in connection.execute(query):
    print(row)
