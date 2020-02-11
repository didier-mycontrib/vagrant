#!/bin/bash


# ATTENTION , le fichier oracle-backup.tar sera très gros (environ 1.3 Go)

# lancement d'un container de type "debian:8" sans nom car execution très courte
# /backup est un alias interne pour $(pwd)
# --volumes-from mysqldbstore permet d'accéder aux volume du "data_container" mysqldbstore
# la commande tar cvf sera lancée pour créer backup.tar dans $(pwd)
echo "stopping oracle-container";
docker stop oracle-container
echo "pause before saving data , ... , enter to continue";read suite;


docker run --rm \
           -v oracle-data-volume:/u01/app/oracle \
           -v $(pwd):/backup debian:8 \
            tar cvf /backup/oracle-backup.tar /u01/app/oracle

echo "pause before restarting oracle-container , ... , enter to continue";read suite;
docker start oracle-container


