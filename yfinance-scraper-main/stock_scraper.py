from datetime import datetime
import mysql.connector
import pandas as pd
import yfinance as yf

DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',         # Replace with your MySQL username
    'password': 'password', # Replace with your MySQL password
    'database': 'stock_prices_db'
}

# 1. Connect to MySQL Database
db = mysql.connector.connect(
    host=DB_CONFIG['host'],
    user=DB_CONFIG['user'],
    password=DB_CONFIG['password'] 
)

cursor = db.cursor()

# 1a. Create MySQL Database
cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DB_CONFIG['database']}")
cursor.execute(f"USE {DB_CONFIG['database']}")

# 2. Create table if it does not exist
cursor.execute("""
    CREATE TABLE IF NOT EXISTS historical_prices (
        ticker VARCHAR(10),
        date DATE,
        open FLOAT,
        high FLOAT,
        low FLOAT,
        close FLOAT,
        volume BIGINT,
        PRIMARY KEY (ticker, Date),
        INDEX stock_id (ticker)
    )
""")

# 3. Download stock data using yfinance
ticker_symbol = "AAPL"
stock = yf.Ticker(ticker_symbol)
df = stock.history(period="1mo")  # Download 1 month of data

# Clean up DataFrame structure
df.reset_index(inplace=True)
# Ensure date is standard string format
df["Date"] = df["Date"].dt.strftime("%Y-%m-%d")

# 4. Insert data into MySQL
for index, row in df.iterrows():
  sql = """
        INSERT INTO historical_prices (ticker, Date, Open, High, Low, Close, Volume)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE 
        Open=%s, High=%s, Low=%s, Close=%s, Volume=%s
    """
  values = (
      ticker_symbol,
      row["Date"],
      row["Open"],
      row["High"],
      row["Low"],
      row["Close"],
      row["Volume"],
      row["Open"],
      row["High"],
      row["Low"],
      row["Close"],
      row["Volume"],
  )
  cursor.execute(sql, values)

# Commit changes and close connection
db.commit()
cursor.close()
db.close()

print(f"Data for {ticker_symbol} saved successfully.")
