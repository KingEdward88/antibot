#! /bin/bash

if command -v .venv &> /dev/null; then
    echo "Environment already found. Skipping installation."
else
    echo "Installing environment..."
    # Add your installation commands here

    python -m venv .venv    #create virtual environemnt
    #source /workspaces/$(basename $PWD)/.venv/bin/activate   #start virtual environment (I get errors here)
    source .venv/bin/activate   #activate virtual environment

    #ensure pip is correctly installed in workspaces
    /workspaces/$(basename $PWD)/.venv/bin/python -m ensurepip --default-pip

    #pip install feedparser  #install feedparser
    pip install mysql-connector-python  #install db connection
    pip install tabulate  #install tabulate for pretty printing of tables
    #pip install yfinance #installs the web scraper yfinance for yahoo finance
    pip install pandas  #data manipulation and analysis package for python
    pip install pymysql #include mysql database

    #install and start a flavor of MYSQL db named mariadb
    sudo apt update
    #sudo apt install mariadb-server -y
    sudo apt install mysql-server -y
    sudo service mysql start
    #sudo mysql -u root  #Log in as root (No password by default on initial local setup)

# Ensure the directory is owned by the mysql user and group
    sudo chown -R mysql:mysql /var/run/mysqld

# Grant read, write, and execute permissions to the directory
    sudo chmod 755 /var/run/mysqld

# Grant full access to the socket file itself
    sudo chmod 777 /var/run/mysqld/mysqld.sock

# Create database to store stock prices
    sudo mysql -u root -p -e 'CREATE DATABASE IF NOT EXISTS primes_db;'
    sudo mysql -u root -p -D primes_db -e 'CREATE TABLE IF NOT EXISTS primes (id INT AUTO_INCREMENT PRIMARY KEY, prime_number INT NOT NULL);'

#mysql commands to void the password requirement of new databases
    DB_USER="root"
    DB_PASS="password"
    DB_NAME="primes_db"

#sudo mysql -u "$DB_USER" -p 

sudo mysql -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" << EOF
    USE mysql;
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
    FLUSH PRIVILEGES;
    EXIT;
EOF


    sudo service mysql restart
    #sudo mysql -u root -p
    #SELECT @@datadir;

    #docker compose -f docker-compose.yml up -d

    echo "source /workspaces/\$(basename \$PWD)/.venv/bin/activate" >> ~/.bashrc

    sudo service mysql status

    #sudo service mysql stop
    #sudo usermod -d /var/lib/mysql/ mysql
    #sudo service mysql start

    #sudo service mysql status

    #run an example program to test connection to database
        #python mysql-scraper.py
    #show the collected database tables
        #sudo ls -la /var/lib/mysql/
    #copy the database table to workspace for inspection  NOTE! cp doesn't work when mysql is running
        #sudo cp -r /var/lib/mysql/* /workspaces/$(basename $PWD)/database
        #sudo service mysql stop
        #sudo cp -r /var/lib/mysql/ /workspaces/catcppca-tests/database/

    #do a data dump of the mysql database to a sql file for inspection
        #sudo mysqldump -u root -p --all-databases > /workspaces/$(basename $PWD)/database/dump.sql
        #sudo mysqldump -u root -p financial_news_db > /workspaces/$(basename $PWD)/database/financial_news_db.sql
    

    #load stored database from project into mysql for use
    #sudo mysql -u root < /workspaces/$(basename $PWD)/database/stock_prices_db.sql
    #mysql -u [username] -p [database_name] < [path_to_dump_file.sql]
    sudo mysql -u root -p primes_db < /workspaces/$(basename $PWD)/database/primes_db.sql

#execute python script to fill database
    python prime_calc.py

#save database to local file
    sudo mysqldump -u root -p primes_db > /workspaces/$(basename $PWD)/database/primes_db.sql

#execute python script to search database
    python search_db.py
fi

