Ce projet vagrant permet de configurer et démarrer une nouvelle box
- en partant de la box fabriquée par va-docker-base 
  "../my-boxes/ubuntu18lts64-docker-compose"
  (linux ubuntu 18.4 64bits avec git, sudo, nano + docker)
- en provisionant la thechnologie d'intégration continue "jenkins"

=====================
Configuration réseau "vagrant":
  # port for jenkins
  config.vm.network "forwarded_port", guest: 8989, host: 8989
=====================
Utilisée de l'intérieur (via vagrant ssh), cette machine virtuelle 
permettra d'effectuer les opérations suivantes:
- récupérer le code source d'un projet de dev(ex: springBoot, node/express)
  via git clone/pull (de façon automatisée ou pas)
- reconstruire ce projet et (re-)fabriquer une nouvelle image docker
- effectuer un "docker push" vers l'autre machine virtuelle "va-docker-registry"
- effectuer des tests d'intégration (avec communication entre conteneurs
  dockers co-localisés , ex: nginx/frontEnd + backend_REST + database).