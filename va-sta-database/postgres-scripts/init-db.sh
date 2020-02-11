#!/bin/bash

# /script in postgres-container is mapped to 
# /vagrant/docker-scripts/postgres-scripts of host
# via -v option of "docker run ..." (lauched before "docker exec ...")

export POSTGRES_SCRIPTS=/scripts
psql -U postgres -f ${POSTGRES_SCRIPTS}/customers-db.sql
psql -U postgres -f ${POSTGRES_SCRIPTS}/orders-db.sql
psql -U postgres -f ${POSTGRES_SCRIPTS}/purchases-db.sql

#psql -U postgres -f ${POSTGRES_SCRIPTS}/create-empty-database.sql
