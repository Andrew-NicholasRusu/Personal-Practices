# Creating Sample Table

"""The following example creates a students table and inserts sample records. 
An in-memory database is used so the example does not create a database file."""
import sqlite3

connection = sqlite3.connect(":memory:")
cursor = connection.cursor()

cursor.execute("""
    CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER,
        department TEXT
    )
""")

cursor.executemany(
    """
    INSERT INTO students (id, name, age, deparment)
    VALUES (?, ?, ?, ?)
    """,
    [
        (1, "Rohit", 21, "IT"),
        (2, "Nitin", 21, "IT"),
        (3, "Virat", 30, "CIVIL"),
        (4, "Rohit", 32, "COMP")
    ]
)

connection.commit()

# Using WHERE Clause

# Example 1: Retrieve Records Matching a Condition. Suppose we need to retrieve students belonging to the IT department.
cursor.execute(
    """
    SELECT id, name, age, department
    FROM students
    WHERE department = ?
    ORDER BY id
    """,
    ("IT",)
)
print(cursor.fetchall()) # [(1, 'Rohit', 21, 'IT'), (2, 'Nitin', 21, 'IT')]

# Example 2: Filter Records Using Comparison Operators. Comparison operators help select records according to numerical or other comparable values.
cursor.execute(
    """
    SELECT name, age
    FROM students
    WHERE age >= ?
    ORDER BY id
    """,
    (30,)
)
print(cursor.fetchall()) # [('Virat', 30), ('Rohit', 32)]

# Explanation:
    # condition age >= ? selects students aged 30 or older.
    # Value 30 is passed separately as a query parameter.
    # Only records satisfying the condition appear in the result.