import mysql.connector

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
limit = 1000
prime_numbers = sieve_of_eratosthenes(limit)
alpha = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']  # Placeholder for alpha values

# Connect to MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="primes_db"
)

cursor = db.cursor()

# Insert primes using executemany for bulk insertion
query = "INSERT IGNORE INTO primes (prime_number, alpha) VALUES (%s, %s)"
data = [(p, a) for p, a in zip(prime_numbers, alpha)]

cursor.executemany(query, data)
db.commit()

print(f"{cursor.rowcount} prime numbers inserted successfully.")

cursor.close()
db.close()