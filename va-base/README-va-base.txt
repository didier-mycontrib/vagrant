Ce projet vagrant permet de construire une nouvelle box
- en partant de la box prédéfinie "hashicorp/bionic64"
  (linux ubuntu 18.4 64bits avec git, sudo, nano, ...)
- en provisionant certaines technologies de dev:
     * docker-ce et docker-compose
     * open jdk-1.11 et maven (java)
     * node 12 et npm 6 (javascript)
- une fois démarrée et initialisée (vagrant up)
  on peut générer une nouvelle box via l'instruction
vagrant package --output ../my-boxes/with-docker-java-node.box

Cette nouvelle box sera par la suite réutilisée 
dans beaucoup d'autres projets "vagrant" .