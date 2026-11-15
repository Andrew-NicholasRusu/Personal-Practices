# Creating Database and Table
"Before deleting records, create an SQLite database and populate a table with sample data. "
"Python's sqlite3 module is included with standard Python installations, so it generally requires no separate installation."

import sqlite3

connection = sqlite3.connect("delete_demo.db")
cursor = connection.cursor()

cursor.execute("DROP TABLE IF EXISTS DELDEMO")

cursor.execute("""
    CREATE TABLE DELDEMO (
        Email TEXT NOT NULL,
        Name TEXT NOT NULL,
        Score INTEGER
    )
""")

data = [
    ("tester1@gmail.com", "Tester1", 25),
    ("tester2@gmail.com", "Tester2", 15),
    ("tester3@gmail.com", "Tester3", 36),
    ("tester4@gmail.com", "Tester4", 27),
    ("tester5@gmail.com", "Tester5", 40),
    ("tester6@gmail.com", "Tester6", 14),
    ("tester7@gmail.com", "Tester7", 10)
]

cursor.executemany(
    "INSERT INTO DELDEMO (Email, Name, Score) VALUES (?, ?, ?)", data
)

connection.commit()
print("Database and table created successfully.")

connection.close()
print("Database and tbale created successfully.")
connection.close()

###### Deleting from Table ######
"""It can remove one or more records depending on the condition. 
The following examples use the GEEK table created above."""

## Ex.1: Delete Rows Using a Condition
"""uppose we want to remove all records whose Score is less than 15. We can use the WHERE clause to select the matching rows."""

import sqlite3

connection = sqlite3.connect("delete_demo.db")
cursor = connection.cursor()

cursor.execute(
    "DELETE FROM DELDEMO WHERE Score < ?",
    (15,)
)
print("Rows deleted:", cursor.rowcount)
connection.commit()

cursor.execute("SELECT Name, Score FROM DELDEMO ORDER BY Score")

print("Remaining rows:")
for row in cursor.fetchall():
    print(row)
connection.close()

## Ex.2: Delete All Rows from a Table
"""To remove every record, execute DELETE without a WHERE clause. The table remains available, but its existing rows are removed."""

import sqlite3

connection = sqlite3.connect("delete_demo.db")
cursor = connection.cursor()
cursor.execute("DELETE FROM DELDEMO")

print("Rows deleted:", cursor.rowcount)

connection.commit()

cursor.execute("SELECT COUNT(*) FROM DELDEMO")
remaining_rows = cursor.fetchone()[0]

print("Remaining rows:", remaining_rows)

connection.close()

