#! /bin/bash

#do a data dump of the mysql database to a sql file for inspection
        #sudo mysqldump -u root -p --all-databases > /workspaces/$(basename $PWD)/database/dump.sql
        sudo mysqldump -u root -p primes_db > /workspaces/$(basename $PWD)/database/primes_db.sql