import sqlite3

conn = sqlite3.connect("students.db")
cursor = conn.cursor()

print("Database connected successfully")

# Creating a table:
cursor.execute("""
    CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT, 
        age INTEGER
    )
""")

cursor.execute(
    "INSERT INTO students (name, age) VALUES (?, ?)",
    ("Aarav", 20)
)

# Retrieving data from SQLite
cursor.execute("SELECT * FROM students")

rows = cursor.fetchall()

for row in rows:
    print(row) # (1, 'Aarav', 20)

conn.commit()
print("Record inserted and changes committed.")
conn.close()