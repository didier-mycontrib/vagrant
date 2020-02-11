#!/bin/bash

#docker stop oracle-container
#docker rm oracle-container


#docker volume rm oracle-data-volume
docker volume create --name oracle-data-volume

# /script in oracle-container is mapped to 
# /vagrant/oracle-scripts of host
# via -v option of "docker run ..." (lauched before "docker exec ...")


export ORACLE_SCRIPTS_IN_HOST=$(pwd)/oracle-scripts

export ORACLE_SCRIPTS_IN_CONTAINER=/scripts

echo ORACLE_SCRIPTS_IN_HOST=${ORACLE_SCRIPTS_IN_HOST}


# -p 22022:22 ou -p 18081:8080 selon image
# image wnameless/oracle-xe-11g ou oracleinanutshell/oracle-xe-11g

docker run --name oracle-container \
		   --net=host \
           -p 18081:8080 -p ${DOCKER_TOOLBOX_IP_PREFIX}1521:1521 \
           -h oracle.container.host \
           -v oracle-data-volume:/u01/app/oracle \
           -v ${ORACLE_SCRIPTS_IN_HOST}:${ORACLE_SCRIPTS_IN_CONTAINER} \
           -d oracleinanutshell/oracle-xe-11g

# -v ${ORACLE_DATA_STORAGE_DIR}:/??? \ ??? (to many path , oradata , tablespaces , ...)

# sid:XE , username: system or sys, password: oracle , ssh: root@localhost / admin
# jdbc:oracle:thin:@localhost_or_...:49161_or_1521:XE

#docker restart oracle-container
docker inspect oracle-container | grep IPAddress
echo "attendre quelques minutes pour qu'oracle soit parfaitement initialisé "
echo "(premier démarrage lent)"
echo "... , enter pour continuer (après quelques minutes)";read suite
