import os
import mysql.connector
from mysql.connector import Error
#from dotenv import load_dotenv

# Load environment variables from a .env file
#load_dotenv()

def get_db_connection():
    """Establishes and returns a connection to the MySQL database."""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='password',
            database='primes_db'
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        return None

print("entering program")

# Example usage:
conn = get_db_connection()

if conn:
    try:
        cursor = conn.cursor()
        
        # ... do your database work here ...
        cursor.execute("SELECT VERSION();")
        row = cursor.fetchone()
        print("Database version:", row)
        
    except Error as e:
        print(f"Error executing query: {e}")
    finally:
        # These MUST be indented inside the 'if conn:' block
        # and safely placed in 'finally' to ensure they close
        cursor.close()
        conn.close()
else:
    print("Could not establish a connection. Check your environment variables.")

