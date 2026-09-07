CREATE DATABASE prime_db;
USE prime_db;

CREATE TABLE primes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prime_number INT UNIQUE
);
