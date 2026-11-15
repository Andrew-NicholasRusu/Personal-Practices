# 1. Setting Up SQLite Database
"""Before updating records, create a table and insert sample data. 
The following example uses an in-memory database so that the examples produce predictable results without modifying an existing database file."""
import sqlite3

conn = sqlite3.connect(":memory")
cursor = conn.cursor()
cursor.execute("""
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT NOT NULL,
    salary INTEGER NOT NULL
    )
""")

employees = [
    (1, "Aditi", "HR", 42000),
    (2, "Rahul", "IT", 65000),
    (3, "Neha", "IT", 72000),
    (4, "Rohan", "Sales", 48000)
]

cursor.executemany(
    """
    INSERT INTO employees (id, name, department, salary)
    VALUES (?, ?, ?, ?)
    """,
)
conn.commit()

# 2. Updating Single Column
"""To change one column for a particular employee, use UPDATE with SET and a condition in WHERE."""
cursor.execute(
    "UPDATE employees SET salary = ? WHERE id = ?",
    (45000, 1)
)
conn.commit()

print(cursor.execute(
    "SELECT * FROM employees WHERE id = ?",
    (1,)
).fetchone())

# 3. Updating Multiple Rows Using Condition
"""UPDATE statement can modify several records that satisfy the same condition."""
cursor.execute(
    """
    UPDATE employees
    SET salary = salary + ?
    WHERE department = ?
    """,
    (2000, "IT")
)
conn.commit()

print(cursor.execute(
    """
    SELECT id, name, salary
    FROM employees
    WHERE department = ?
    ORDER BY id
    """,
    ("IT",)
).fetchall())

# 4. Updating Multiple Columns
"""Multiple columns can be modified in the same UPDATE statement by separating their assignments with commas. """
cursor.execute(
    """
    UPDATE employees
    SET department = ?, salary = ?
    WHERE id = ?
    """,
    ("Finance", 68000, 2)
)
conn.commit()

print(cursor.execute(
    "SELECT * FROM employees WHERE id = ?",
).fetchone())

# 5. Updating All Rows
"""UPDATE statement does not contain a WHERE clause, SQLite applies the specified changes to every 
row in the target table. Use this approach only when modifying all records is intentional."""
cursor.execute(
    "UPDATE employees SET department = ?",
    ("Operations",)
)
conn.commit()

# 6. Verifying Updated Data
"""After performing the updates, SELECT can retrieve the complete table to verify the changes."""
cursor.execute(
    """
    SELECT id, name, department, salary
    FROM employees
    ORDER BY id
    """
)
for row in cursor.fetchall():
    print(row)