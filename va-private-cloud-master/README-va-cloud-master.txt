Ce projet vagrant permet de configurer et démarrer une nouvelle box
- en partant de la box  prédéfinie hashicorp/bionic64
- en provisionant l'image docker "rancher/rancher"
  de façon à faire fonctionner la technologie "rancher 2" 
  permettant de initialiser et superviser des clusters "kubernates"

========
vision externe (console) :  https://localhost:5443 (admin/admin)
=====================
Utilisée de l'intérieur (via vagrant ssh), cette machine virtuelle 
permettra d'effectuer les opérations suivantes:
- tester une communication avec une autre machine virtuelle "va-docker-registry"
- de déployer une application sur un cluster privé 
  (essentiellement à des fins de tests)