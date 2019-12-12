Ce projet vagrant permet de configurer et démarrer une nouvelle box
- en partant de la box fabriquée par va-base 
  "../my-boxes/with-docker-java-node.box"
  (linux ubuntu 18.4 64bits avec git, sudo, nano + docker + jdk/maven  + node/npm)
- en provisionant l'image docker "rancher ... "
  de façon à faire fonctionner un cluster kubernates


=====================
Utilisée de l'intérieur (via vagrant ssh), cette machine virtuelle 
permettra d'effectuer les opérations suivantes:
- effectuer un "docker pull" vers l'autre machine virtuelle "va-docker-registry"
- de déployer une application sur un cluster privé 
  (essentiellement à des fins de tests)