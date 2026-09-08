import mysql.connector
from mysql.connector import Error

try:
    # 1. Establish connection to the MySQL server
    # Note: Do not specify a 'database' argument since you are deleting it
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="password"
    )
    
    if connection.is_connected():
        cursor = connection.cursor()
        
        # 2. Define and execute the DROP DATABASE statement
        # Using 'IF EXISTS' prevents an error if the database is already gone
        db_name = "primes_db"
        sql_query = f"DROP DATABASE IF EXISTS {db_name}"
        
        cursor.execute(sql_query)
        print(f"Database '{db_name}' has been successfully deleted.")

except Error as e:
    print(f"Error while connecting to MySQL: {e}")

finally:
    # 3. Clean up and close connection resources
    if 'cursor' in locals() and cursor is not None:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
        print("MySQL connection closed.")
