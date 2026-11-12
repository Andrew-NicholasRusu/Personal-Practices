# 1. Inserting Data Using Only Values

import sqlite3

conn = sqlite3.connect("school.db")
cursor = conn.cursor()

cursor.execute("""
    CREATE TABLE IF NOT EXISTS STUDENT (
        NAME TEXT,
        CLASS TEXT,
        SECTION TEXT
    )
""")

cursor.execute(
    "INSERT INTO STUDENT VALUES (?, ?, ?)",
    ("Raju", "7th", "A")
)

conn.commit()

cursor.execute(
    "SELECT * FROM STUDENT ORDER BY rowid DESC LIMIT 1"
)
print(cursor.fetchone()) # ('Raju', '7th', 'A')

conn.close()

# 2. Inserting Using Column name and Values

"""This approach specifies the target columns explicitly. It allows values to be inserted in a different order 
from the table definition, provided each value matches its corresponding column."""
import sqlite3

conn = sqlite3.connect("school.db")
cursor = conn.cursor()

cursor.execute(
    """
    INSERT INTO STUDENT (CLASS, SECTION, NAME)
    VALUES (?, ?, ?)
    """
    ("8th", "B", "Shyam")
)

conn.commit()

cursor.execute(
    "SELECT * FROM STUDENT ORDER BY rowid DESC LIMIT 1"
)
print (cursor.fetchone()) # ('Shyam', '8th', 'B')
 
conn.close() 


# 3. Inserting Multiple Records USing executemany()
"""This method executes a parameterized SQL statement for each set of values supplied in an iterable. 
It is useful when inserting multiple records with the same structure."""
import sqlite3

conn = sqlite3.connect("school.db")
cursor = conn.cursor()

students = [
    ("Meena", "8th", "B"),
    ("Aman", "9th", "C"),
    ("Priya", "7th", "A")
]

cursor.executemany(
    """
    INSERT INTO STUDENT (NAME, CLASS, SECTION) 
    VALUES (?, ?, ?)
    """
    students
)

conn.commit()

print("Inserted records:", cursor.rowcount) # Inserted records: 3

conn.close()