#! /bin/bash

if command -v .venv &> /dev/null; then
    echo "Environment already found. Skipping installation."
else
    echo "Installing environment..."
    # Add your installation commands here

    python -m venv .venv    #create virtual environemnt
#enter the newly created environment for python
    source .venv/bin/activate   #start virtual environment

    pip install feedparser  #install feedparser
    pip install mysql-connector-python  #install db connection
    pip install tabulate  #install tabulate for pretty printing of tables
    pip install yfinance #installs the web scraper yfinance for yahoo finance
    pip install pandas  #data manipulation and analysis package for python

    #install and start a flavor of MYSQL db named mariadb
    sudo apt update
    #sudo apt install mariadb-server -y
    sudo apt install mysql-server -y
    sudo service mysql start
#ensure proper ownership of mysqld such that there are no permission denied errors
    #sudo mkdir -p /var/run/mysqld
    #sudo chown -m mysql:mysql /var/run/mysqld
    #exitsudo chmod 777 /var/run/mysqld
    #sudo mysql -u root


    #sudo mysql -u root  #Log in as root (No password by default on initial local setup)

    #mysql commands to void the password requirement of new databases

        DB_USER="root"
        DB_PASS="password"
        DB_NAME="stock_prices_db"

        mysql -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" <<EOF
            USE mysql;
            CREATE USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
            GRANT ALL PRIVILEGES ON stock_prices_db.* TO 'user'@'localhost';
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



    #ensure pip is correctly installed in workspaces
    #/workspaces/$(basename $PWD)/.venv/bin/python -m ensurepip --default-pip



fi