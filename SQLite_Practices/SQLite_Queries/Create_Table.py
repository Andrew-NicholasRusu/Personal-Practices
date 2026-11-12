# Steps to Create a Table
    # 1. Use import sqlite3 to access SQLite functionality in Python.
    # 2. Use the connect() method to establish a connection to your SQLite database.
    # 3. The cursor() method creates a cursor object that allows you to execute SQL commands.
    # 4. The execute() method of the cursor object is used to run the SQL CREATE TABLE command.
    # 5. After executing the required commands, it is essential to close the connection to the database.

import sqlite3

connection = sqlite3.connect("school.db")

cursor = connection.cursor()

cursor.execute("""
    CREATE TABLE IF NOT EXISTS students (
        student_id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER,
        grade REAL
    )
""")

connection.commit()

cursor.execute("""
    SELECT name
    FROM sqlite_master
    WHERE type = 'table' AND name = 'students'
""")
print("Table exists:", cursor.fetchone() is not None)

connection.close()

# Explanation:
    # sqlite3.connect("school.db") opens the database or creates the file if it does not exist.
    # connection.cursor() creates a cursor for executing SQL statements.
    # CREATE TABLE IF NOT EXISTS creates the students table only when it does not already exist.
    # student_id INTEGER PRIMARY KEY uniquely identifies each student, while name TEXT NOT NULL requires a name.
    # age INTEGER and grade REAL define columns for age and numeric grades.
    # connection.commit() commits pending changes to the database.
    # SELECT query checks the database schema for the students table. fetchone() returns a row when the table exists and None otherwise.
    # connection.close() closes the database connection.