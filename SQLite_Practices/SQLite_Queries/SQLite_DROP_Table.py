## Creating Sample Table
"""First, create a database connection and an employees table containing sample records. 
This setup provides a table to use in the subsequent examples."""
import sqlite3

connection = sqlite3.connect("company.db")
cursor = connection.cursor()
cursor.execute("DROP TABLE IF EXISTS employees")

cursor.execute("""
    CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    salary REAL
    )
""")

employees = [
    (1, "Aditi", 42000),
    (2, "Rahul", 65000),
    (3, "Neha", 72000)
]

cursor.executemany(
    "INSERT INTO employees (id, name, salary) VALUES (?, ?, ?)",
    employees
)

connection.commit()
connection.close()

print("Table create successfully.")

## Dropping Existing Table
"""After creating the table, execute DROP TABLE to remove it from the database."""
import sqlite3

connection = sqlite3.connect("company.db")
cursor = connection.cursor()
cursor.execute("DROP TABLE employees")

connection.commit()
connection.close()

print("Table dropped successfully")

### ropping Table Only If it Exists ###
"""When a table may already have been removed, 
use DROP TABLE IF EXISTS to avoid an error caused by its absence."""

import sqlite3

connection = sqlite3.connect("company.db")
cursor = connection.cursor()
cursor.execute("DROP TABLE IF EXISTS employees")

connection.commit()
connection.close()

print("Table removal completed.")

### erifying Whether Table was Dropped ###
"""We can query SQLite's system catalog to check whether the employees table still exists."""

import sqlite3

connection = sqlite3.connect("company.db")
cursor = connection.cursor()

cursor.execute("""
    SELECT name
    FROM sqlite_master
    WHERE type = 'table' AND name = ?
""", ("employees",))
result = cursor.fetchone()

print("Table exists:", result is not None)
connection.close()