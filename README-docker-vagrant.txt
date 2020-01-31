Au sein d'une box/vm vagrant , on a souvent besoin
de faire fonctionner des technologies (ex: java ou nodeJs)
de manière indirecte : DANS UN CONTENEUR DOCKER .

Même jenkins peut fonctionner dans docker et lancer des agents 
de type "docker in docker" .
----------
Presque toutes les box/vm modernes ont avant tout besoin
d'un provisionning "base linux + docker" (et éventuellement docker-compose)
----------
Rarement besoin de provisionner "jdk , node" directement sur la vm.
