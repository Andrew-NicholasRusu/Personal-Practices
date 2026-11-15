# Updating Specific Column
"""Following program creates a STUDENTS table, inserts sample records, updates one student's name, 
and changes the address of students who satisfy a condition."""

import sqlite3
connection = sqlite.connect(":memory:")

try: 
    connection.execute("""
        CREATE TABLE STUDENTS (
            SID INTEGER PRIMARY KEY,
            SNAME TEXT NOT NULL,
            SAGE INTEGER NOT NULL,
            ADDRESS TEXT
        )
    """)
    connection.executemany(
        """
        INSERT INTO STUDENTS (SID, SNAME, SAGE, ADDRESS)
        VALUES (?, ?, ?, ?)
        """,
        [
            (1, "Mohan", 22, "Ponnur"),
            (2, "Sudheer", 28, "Chebrolu"),
            (3, "Neha", 22, "Tenali"),
        ],
    )
    connection.commit()

    print("Original Table:")
    for row in connection.execute(
        "SELECT * FROM STUDENTS ORDER BY SID"
    ):
        print(row)

    connection.execute(
        "UPDATE STUDENTS SET SNAME = ? WHERE SID = ?",
        ("Sravan", 1),
    )

    connection.execute(
        "UPDATE STUDENTS SET ADDRESS = ? WHERE SAGE = ?",
        ("Naga", 22),
    )
    connection.commit()

    print("\nUpdated Table:")
    for row in connection.execute(
        "SELECT * FROM STUDENTS ORDER BY SID"
    ):
        print(row)

finally:
    connection.close()

