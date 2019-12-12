vagrant plugin install vagrant-hostmanager
vagrant plugin list
------------------------

va-base = projet vagrant de base 
    pour construire box avec docker,jdk1.11/maven,nodeJs12/npm
==> resultat = my-boxes/with-docker-java-node.box

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


...


  