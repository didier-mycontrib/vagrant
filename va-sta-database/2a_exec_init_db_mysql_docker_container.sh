#!/bin/bash

# /script in mysql-container is mapped to 
# /vagrant/mysql-scripts of host
# via -v option of "docker run ..." (lauched before "docker exec ...")


export MYSQL_SCRIPTS_IN_HOST=$(pwd)/mysql-scripts
export MYSQL_SCRIPTS_IN_CONTAINER=/scripts
# -v ${MYSQL_SCRIPTS_IN_HOST}:${MYSQL_SCRIPTS_IN_CONTAINER} 
# in previous docker run ...
# bug with vagrant : /script may be empty after restarting
# workaround : re-run 1a script before 2a script .
docker exec mysql-container  bash -c ${MYSQL_SCRIPTS_IN_CONTAINER}/init-db.sh

echo pause; read pause;

#docker exec  -it mysql-container bash 

# with in bash interactive console :
# mysql -u root -proot -e 'CREATE DATABASE IF NOT EXISTS test;USE test;DROP TABLE IF EXISTS Customer;CREATE TABLE Customer(id integer primary key auto_increment,name VARCHAR(64));INSERT INTO Customer(id,name) VALUES (1 , "first customer");'
# exit

