"""We are going to create a table and then perform update operations in it."""

# importing sqlite module
import sqlite3

# create connection to the database my_database
connection = sqlite3.connect('my_database.db')

# create table named address of customers
# with 4 columns id, name, age and address
connection.execute('''CREATE TABLE SHIP (SHIP_ID INT, SHIP_NAME \ 
TEXT NOT NULL, SHIP_DESTINATION CHAR(50) NOT NULL); ''')
print("Ship table created successfully")

# close the connection
connection.close()

