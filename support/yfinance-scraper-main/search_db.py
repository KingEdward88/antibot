import mysql.connector
from mysql.connector import Error

def search_database(search_term):
    connection = None
    cursor = None
    try:
        print(" Establish connection to the MySQL database")
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="password",
            database="stock_prices_db"
        )

        if connection.is_connected():
            cursor = connection.cursor(dictionary=True) # Returns rows as dictionaries (column_name: value)
            
            # Define a parameterized search query using SQL 'LIKE' for partial matching
            # '%s' acts as the placeholder for our search value
            #query = "SELECT * FROM historical_prices WHERE ticker LIKE %s OR email LIKE %s"
            query = "SELECT * FROM historical_prices WHERE ticker LIKE %s"

            # Format the search term with wildcards for a flexible search
            formatted_search = f"%{search_term}%"
            #query_params = (formatted_search, formatted_search)
            query_params = (formatted_search)

            # Execute query and pass parameters safely
            cursor.execute(query, [query_params])
            
            # Fetch all matching search results
            results = cursor.fetchall()

            # Process and display the results
            if results:
                print(f"\n--- Found {len(results)} match(es) for '{search_term}': ---")
                for row in results:
                    print(f"Stock: {row['ticker']} | Date: {row['date']} | Open: {row['open']} | High: {row['high']} | Low: {row['low']} | Close: {row['close']} | Volume: {row['volume']}")
            else:
                print(f"\nNo records found matching '{search_term}'.")

    except Error as e:
        print(f"Error while connecting to or querying MySQL: {e}")
        
    finally:
        # Guarantee cleanup of open database resources
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("\nMySQL connection securely closed.")

# Execute the search
if __name__ == "__main__":
    user_input = input("Enter a name or email to search: ")
    search_database(user_input)
