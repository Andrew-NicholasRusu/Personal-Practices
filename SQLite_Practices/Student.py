import sqlite3
conn = sqlite3.connect("student_data.db")
cur = conn.cursor()

student = """CREATE TABLE STUDENTS
(STUDENT_ROLL_NO INTEGER PRIMARY KEY AUTOINCREMENT,
STUDENT_NAME VARCHAR(255) NOT NULL,
STUDENT_CLASS VARCHAR(255) NOT NULL,
STUDENT_EMAIL VARCHAR(255) NOT NULL,
STUDENT_PH_NO INTEGER NOT NULL)"""

cur.execute(student)
conn.close()