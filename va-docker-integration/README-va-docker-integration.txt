Ce projet vagrant permet de configurer et démarrer une nouvelle box
- en partant de la box fabriquée par va-base 
  "../my-boxes/with-docker-java-node.box"
  (linux ubuntu 18.4 64bits avec git, sudo, nano + docker + jdk/maven  + node/npm)
- en provisionant quelques images "docker" fondamentales (nginx,...)

=====================
Configuration réseau "vagrant":
  config.vm.network "forwarded_port", guest: 80, host: 8383
Configuration réseau du conteneur docker "nginx":
  docker run --network host ... -d nginx
--> curl http://localhost:80 en interne (vagrant ssh)
--> http://localhost:8383 depuis navigateur de la machine hôte.
=====================
Utilisée de l'intérieur (via vagrant ssh), cette machine virtuelle 
permettra d'effectuer les opérations suivantes:
- récupérer le code source d'un projet de dev(ex: springBoot, node/express)
  via git clone/pull (de façon automatisée ou pas)
- reconstruire ce projet et (re-)fabriquer une nouvelle image docker
- effectuer un "docker push" vers l'autre machine virtuelle "va-docker-registry"
- effectuer des tests d'intégration (avec communication entre conteneurs
  dockers co-localisés , ex: nginx/frontEnd + backend_REST + database).