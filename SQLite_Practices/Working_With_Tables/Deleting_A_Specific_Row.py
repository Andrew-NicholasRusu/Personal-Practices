"""We are going to create a table and then perform deletion operations in it."""

# importing sqlite module
import sqlite3

# create connection to the database 
# my_database
connection = sqlite3.connect('my_database.db')

# create table named address of customers 
# with 4 columns id,name age and address
connection.execute('''CREATE TABLE ship (ship_id INT, ship_name \
TEXT NOT NULL, ship_destination CHAR(50) NOT NULL); ''')

print("Ship table created successfully")

# close the connection
connection.close()

"""Example 1: Python program to insert data and delete data where 2 is ship id."""

# import sqlite module database
import sqlite3

# create connection to the database
# my_database
connection = sqlite3.connect('my_database.db')

# insert query to insert values
connection.execute("INSERT INTO SHIP  VALUES (1, 'tata-hitachi','noida' )")
connection.execute("INSERT INTO SHIP  VALUES (2, 'tata-mumbai','mumbai' )")
connection.execute("INSERT INTO SHIP  VALUES (3, 'tata-express','hyderabad' )")

# query to display all data in the table
cursor = connection.execute("SELECT * FROM SHIP")
print("Actual data")

# display row by row
for row in cursor:
    print(row)

# query to delete all data where ship_id = 2
connection.execute("DELETE FROM SHIP WHERE SHIP_ID=2")
print("After delete ship id = 2 row")

# display row by row
cursor = connection.execute("SELECT * FROM SHIP")
for row in cursor:
    print(row)

# close the connection
connection.close()

"""Example 2: In this example delete data where the ship address is hyderabad on the same table."""

# import sqlite module database
import sqlite3

# create connection to the database
# my_database
connection = sqlite3.connect('my_database.db')

# insert query to insert values
connection.execute("INSERT INTO ship  VALUES (1, 'tata-hitachi','noida' )")
connection.execute("INSERT INTO ship  VALUES (2, 'tata-mumbai','mumbai' )")
connection.execute("INSERT INTO ship  VALUES (3, 'tata-express','hyderabad' )")

# query to display all data in the table
cursor = connection.execute("SELECT * FROM SHIP")
print("Actual data")

# display row by row
for row in cursor:
    print(row)

# query to delete all data where ship_id = 2
connection.execute("DELETE FROM SHIP WHERE SHIP_DESTINCATION='HRDERABAD'")

print("After deletering ship address = hyderabad row")

# display row by row
cursor = connection.execute("SELECT * FROM SHIP")
for row in cursor:
    print(row)

# close the connection
connection.close()

