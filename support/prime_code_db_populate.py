import mysql.connector
import random
from support.ascii import ascii

# Function to calculate primes using Sieve of Eratosthenes
def sieve_of_eratosthenes(n):
    prime = [True] * (n + 1)
    p = 2
    while (p * p <= n):
        if (prime[p] == True):
            for i in range(p * p, n + 1, p):
                prime[i] = False
        p += 1
    return [p for p in range(2, n + 1) if prime[p]]

# Calculate primes up to 1000
limit = 10000
prime_numbers = sieve_of_eratosthenes(limit)
prime_numbers_code = prime_numbers.copy()
random.shuffle(prime_numbers_code)

alpha = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']  # Placeholder for alpha values
ascii = ascii()
print("number of saved ascii characters: ",len(ascii))

print(f"{type(prime_numbers)=}, {type(prime_numbers_code)=}, {type(ascii)=}")
print("prime numbers: ", prime_numbers, "\n\n\n\n\n\n\n | prime number code: ", prime_numbers_code)

# Connect to MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="primes_db"
)

cursor = db.cursor()

#delete primes table from database
query = "DROP TABLE primes;"
cursor.execute(query)
#add table for primes and ascii to database
query = "CREATE TABLE primes (id INT AUTO_INCREMENT PRIMARY KEY, prime_number INT NOT NULL UNIQUE, prime_number_code INT NOT NULL UNIQUE, ascii VARCHAR(255) CHARACTER SET utf8mb4);"
cursor.execute(query)

# Insert primes using executemany for bulk insertion
query = "INSERT IGNORE INTO primes (prime_number, prime_number_code, ascii) VALUES (%s, %s, %s)"
data = [(p, c, a) for p, c, a in zip(prime_numbers, prime_numbers_code, ascii)]

cursor.executemany(query, data)
db.commit()

print(f"{cursor.rowcount} prime numbers inserted successfully.")

cursor.close()
db.close()