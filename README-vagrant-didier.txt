vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-docker-compose
vagrant plugin list
-----------------------
réseau privé vargrant/virtualBox anciennement avec dhcp
maintenant avec adresse ip fixes (privées) ---> pour stabilité de la config
------------------------

va-base = projet vagrant de base 
    pour construire box avec docker,jdk1.11/maven,nodeJs12/npm
==> resultat = my-boxes/with-docker-java-node.box
    NB: cette base est surtout utile pour java et/ou nodeJs
        pour faire simplement faire tourner un conteneur docker
        on peut partir de l'image vagrant prédéfinie 
        "hashicorp/bionic64" puis utiliser directement
        config.vm.provision :docker , ...
	et éventuellement config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", rebuild: true, run: "always"
        avec "vagrant plugin install vagrant-docker-compose"


va-docker-integration =
  projet vagrant pour effectuer de l'intégration continue , 
  pour construire des images dockers
  et pour tester des compositions dockers (sans cluster)
  (ex: nginx/frontEnd + backend springBoot ou node/express + database)

va-docker-registry = projet vagrant pour faire fonctionner
   "secure & private docker registry" with https access
   NB: hostname=dockregistry.mycompany.fun (:443 SSL)
       username=registry-sa
       password=registry-pwd

va-private-cloud-master = projet vagrant 
    pour faire fonctionner la partie maître d'un cluser kubernates
    (indirectement via rancher)
...

va-sta-xxyy = projet vagrant 
    pour faire fonctionner un serveur xxyy en mode standalone (autonome)

va-sta-oauth = oauth2 (serveur d'authentification)
va-sta-mariadb = mariadb (comme mysql) + ...
va-sta-postgres = postgres (postgresql)
va-sta-mongo = mongoDB + ...
va-sta-cassandra
...
va-sta-elastic-kibana (elastic search + kibana + ...)
va-sta-hadoop ?


...

------------------------
pour réseau privé avec dhcp seulement:
--> C:\Program Files\Oracle\VirtualBox dans être dans le PATH de la machine hote
pour que VBoxManage soit trouvé (si besoin avec config.hostmanager.ip_resolver)
et le plugin vagrant-hostmanager
----------

  