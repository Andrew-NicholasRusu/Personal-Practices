"""SQLite LIMIT clause specifies the maximum number of rows a query can return. 
It can be combined with WHERE to filter records and ORDER BY to sort results before limiting them."""

# Creating Table:
"""Before using the LIMIT clause, let's create an employees table and insert sample records into it. """

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

cursor.execute("""
INSERT INTO employees (id, name, department, salary)
VALUES (?, ?, ?, ?)
""", [
    (1, "Aditi", "HR", 42000),
    (2, "Rahul", "IT", 65000),
    (3, "Neha", "IT", 72000),
    (4, "Karan", "Sales", 38000),
    (5, "Priya", "Finance", 58000),
    (6, "Aman", "IT", 61000)
])
cursor.execute("SELECT * FROM employees")

print("ID Name  Department  Salary")
print("-" * 35)

for row in cursor.fetchall():
    print(f"{row[0]:<3} {row[1]:<7} {row[2]:<12} {row[3]}")

conn.close()

# 1. Using Basic LIMIT Clause
"""Following query retrieves the first three records when sorted by employee ID."""

cursor.execute("""
SELECT id, name, salary
FROM employees
ORDER BY id         
LIMIT 3;
""")

print("id   name    salary")
for row in cursor.fetchall():   # fetchall() retrieves all rows returned by the query.
    print(f"{row[0]:<3} {row[1]:<7} {row[2]}")

# 2. Using with Multiple Columns
"""It applies to rows, regardless of how many columns are selected. 
We can retrieve multiple columns while restricting the number of records."""

cursor.execute("""
SELECT name, department
FROM employees
ORDER BY id
LIMIT 4;
""")

print("name     department")
for row in cursor.fetchall():
    print(f"{row[0]:<7} {row[1]}")

# 3. Using with WHERE and ORDER BY:
"""It can be combined with WHERE to filter records and ORDER BY to sort matching results. 
This is useful when retrieving the highest-paid employees or other top-ranked records."""

cursor.execute("""
SELECT name, salary
FROM employees
WHERE salary >= 50000
ORDER BY salary DESC
LIMIT 3;
""")

print("name     salary")
for row in cursor.fetchall():
    print(f"{row[0]:<7} {row[1]}")

# 4. Using with OFFSET
"""It skips a specified number of rows before returning results. 
Combining LIMIT and OFFSET allows us to retrieve different portions of a result set, which is commonly used for pagination."""
cursor.execute("""
SELECT id, name, department
FROM employees
ORDER BY id
LIMIT 2 OFFSET 2;
""")

print("id   name    department")
for row in cursor.fetchall():
    print(f"{row[0]:<3} {row[1]:<7} {row[2]}")

# 5. Using with Comma-Separated Values
"""It also supports a comma-separated form of LIMIT and OFFSET. In this syntax, the first number specifies the offset, and the second specifies the maximum number of rows."""

cursor.execute("""
SELECT id, name
FROM employees
ORDER BY id
LIMIT 2, 3;
""")

print("id   name")
for row in cursor.fetchall():
    print(f"{row[0]:<3} {row[1]}")

# Explanation:
    # First value, 2, skips two rows.
    # Second value, 3, returns up to three rows after skipping.
    # Form reverses the order of the arguments compared with LIMIT row_count OFFSET offset_value.

