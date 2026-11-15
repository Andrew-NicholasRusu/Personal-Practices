"""To check whether a table exists in an SQLite database, Python can query the sqlite_master table using the sqlite3 module. The query searches for a table with the 
specified name and returns a result if the table exists. SQLite stores information about database objects such as tables in the sqlite_master table.
We can query this table using the table name to determine whether a specific table exists."""

"Example: In this example, we connect to an SQLite database, create three tables, and then check whether the STUDENT and TEACHER tables exist."
import sqlite3
con = sqlite3.connect("school.db")
cur = con.cursor()

# Using IF NOT EXISTS
"""The IF NOT EXISTS clause prevents an error when a table is already present in the database. It allows the same CREATE TABLE 
statement to be executed without trying to recreate an existing table."""

cur.execute("""
    CREATE TABLE IF NOT EXISTS EMPLOYEE (
        id INTEGER,
        name TEXT,
        age INTEGER
    )
""")

cur.execute("""
    CREATE TABLE IF NOT EXISTS EMPLOYEE (
        id INTEGER,
        name TEXT,
        age INTEGER
    )
""")

cur.execute("""
    CREATE TABLE IF NOT EXISTS STUDENT (
        id INTEGER,
        name TEXT,
        age INTEGER
    )
""")

cur.execute("""
    CREATE TABLE IF NOT EXIST STAFF (
        id INTEGER,
        name TEXT
    )
""")

def table_exists(name):
    result = cur.execute(
        """
        SELECT name
        FROM sqlite_master
        WHERE type = 'table' AND name = ?
        """,
        (name,)
    ).fetchone()

    return result is not None

print("STUDENT:", table_exists("STUDENT"))
print("TEACHER:", table_exists("TEACHER"))
con.close()

# Checking Multiple Tables
"""The same function can be used to check several table names."""

tables = ["STUDENT", "EMPLOYEE", "TEACHER"]

for table in tables:
    if table_exists(table):
        print(f"{table} exists")
    else:
        print(f"{table} does not exist.")

        