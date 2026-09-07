from datetime import datetime
import mysql.connector
import pandas as pd
import yfinance as yf

# 1. Connect to MySQL Database
db = mysql.connector.connect(
    host="localhost", 
    user="root", 
    password="password", 
    database="stock_prices_db"
)
cursor = db.cursor()

# 1a. Create MySQL Database
cursor.execute("""
    CREATE DATABASE IF NOT EXISTS stock_prices_db 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;
""")

# 2. Create table if it does not exist
cursor.execute("""
    CREATE TABLE IF NOT EXISTS historical_prices (
        ticker VARCHAR(10),
        Date DATE,
        Open FLOAT,
        High FLOAT,
        Low FLOAT,
        Close FLOAT,
        Volume BIGINT,
        PRIMARY KEY (ticker, Date)
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
