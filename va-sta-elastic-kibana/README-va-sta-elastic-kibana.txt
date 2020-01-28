Ce projet vagrant permet de configurer et démarrer une nouvelle box
  "nginx (sécurisé/sécurisable) + elasticSearch + Kibana"
- en partant de la box fabriquée par va-base 
  "../my-boxes/with-docker-java-node.box"
  (linux ubuntu 18.4 64bits avec git, sudo, nano + docker + jdk/maven  + node/npm)
- with hostname=elastic.mycompany.fun 
- outside (vagrant) port : 8888
- docker-compose with "nginx" + "elasticsearch" + "kibana" .
- avec 4Go ram mini (java gourmand en interne)
===================
plugin vagrant (nécessaire) à installer (si pas déja fait):
vagrant plugin install vagrant-docker-compose
=====
http://localhost ou elastic.mycompany.fun:8080 ou 8888/api/es
http://localhost ou elastic.mycompany.fun:8080 ou 8888 --> kibana