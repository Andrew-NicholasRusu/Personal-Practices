# Following example creates an in-memory database, inserts values of different types, and displays the corresponding Python types.

import sqlite3

connection = sqlite3.connect(":memory:")

connection.execute("""
    CREATE TABLE sample (
        null_value,
        integer_value INTEGER,
        real_value REAL,
        text_value TEXT,
        blob_value BLOB
    )
""")

connection.execute("""
    INSERT INTO sample VALUES (?, ?, ?, ?, ?)
""", (None, 25, 3.14, "Python", b"\x01\x02\x03"))

row = connection.execute(
    "SELECT * FROM sample"
).fetchone()

columns = ["NULL", "INTEGER", "REAL", "TEXT", "BLOB"]

for column, value in zip(columns, row):
    print(f"{column}: {value} ({type(value).__name__})")

connection.close()