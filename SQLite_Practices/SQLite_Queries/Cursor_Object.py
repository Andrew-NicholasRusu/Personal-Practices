import sqlite3

connection = sqlite3.connect(":memory:")
cursor = connection.cursor()

print(type(cursor).__name__)

cursor.execute("""
    CREATE TABLE cursor_object_students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        marks INTEGER
    )
""")

# Executing SQL Queries Using execute()
cursor.execute(
    "SELECT * FROM cursor_object_students WHERE marks >= ?",
    (80,)
)

# Executing Multiple Queries with executemany()

cursor_object_students = [
    ("Asha", 85),
    ("Rohan", 92),
    ("Meera", 78)
]

cursor.executemany(
    "INSERT INTO cursor_object_students (name, marks) VALUES (?, ?)",
    cursor_object_students
)

## Fetching Data from Cursor

# 1. fetchone()
cursor.execute("SELECT name FROM cursor_object_students")
row = cursor.fetchone()
print(row)

# fetchmany()
cursor.execute("SELECT name FROM cursor_object_students")
rows = cursor.fetchmany(2)
print(rows)

# fetchall()
cursor.execute("SELECT name FROM cursor_object_students")
rows = cursor.fetchall()
print(rows)

# Iterating over a cursor
cursor.execute("SELECT name, marks FROM cursor_object_students")

for row in cursor:
    print(row)

cursor.close()
connection.close()