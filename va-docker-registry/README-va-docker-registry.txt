NB: dernière version (expérimentale)
pour envoi(push):
-----------
docker tag image:tag dockregistry.mycompany.fun:4443/image:tag
docker login -uregistry-sa -pregistry-pwd dockregistry.mycompany.fun:4443
docker push dockregistry.mycompany.fun:4443/image:tag

pour lecture (pull):
docker pull dockregistry.mycompany.fun/image:tag (:443 / ssl)
curl -v https://dockregistry.mycompany.fun/v2/_catalog pour liste des images
---------------------
Ce projet vagrant permet de configurer et démarrer une nouvelle box
- en partant de la box prédéfinie hashicorp/bionic64 
- with hostname=dockregistry.mycompany.fun (ssl CN)
- en provisionant l'image docker "registry:2"
- en initialisant un compte d'accès ssl pour basic auth
  (username=registry-sa,password=registry-pwd)
  NB: registry:2 (docker) doit absolument etre appelé en SSL 
      et necessite donc .crt si "self-signed-certifcate"
      mais l'authentification  basic_http n'est pas obligatoire et donc
      pas imposée par cette vm (paramètres en commentaire)
- en démarrant ( --restart always ) le conteneur docker
  correspondant à un "secure private docker registry" .
=====================
Configuration réseau "vagrant":
  config.vm.network "forwarded_port", guest: 443  host: 2443
  (vu comme :443 depuis les autres machines virtuels du même réseau privé,
   vu comme :2443 depuis machine réelle hôte (ex: windows))
  config.vm.network "private_network", type: "dhcp"
Configuration réseau du conteneur docker "registry":
  docker run --network host  ... -d registry:2
--> https://localhost:2443 ou https://localhost:4443 depuis la machine hôte.
-----------------------------------------------------------------------
NB: 2 points d'entree en interne (réseau prive):
dockregistry.mycompany.fun:443 (ssl) pour docker pull sans docker login
dockregistry.mycompany.fun:4443 pour docker push  avec docker login
=====================
Utilisée de l'extérieur, cette machine virtuelle , fera office de 
référentiel d'images "docker" (push et pull)
====================
depuis autre box:
 1) recopier et installer (via le .sh à lancer) le certificat dockregistry.mycompany.fun.crt
 2) adapter (si besoin) etc/hosts via sudo nano
    (exemple: 192.168.33.20   dockregistry.mycompany.fun)
 3) test via :
    curl -u admin:password -v http_or_https://ip_address:5000_or_443/v2/_catalog
    exemple:
      curl -u registry-sa:registry-pwd -v http://dockregistry.mycompany.fun:5000/v2/_catalog 
      curl -u registry-sa:registry-pwd -v https://dockregistry.mycompany.fun:4443/v2/_catalog
      curl -u registry-sa:registry-pwd -v https://dockregistry.mycompany.fun/v2/_catalog
        ou plus simplement si pas du username/password demandé en basic auth
      curl -v https://dockregistry.mycompany.fun/v2/_catalog

    docker login -uregistry-sa -pregistry-pwd  dockregistry.mycompany.fun
    docker login -uregistry-sa -pregistry-pwd  dockregistry.mycompany.fun:4443 (:443 par defaut)
      

    docker tag image:tag dockregistry.mycompany.fun/image:tag
    (inverse/unttagued via docker image rm dockregistry.mycompany.fun/image:tag)
    exemple:
    docker tag nginx:1.16 dockregistry.mycompany.fun:4443/nginx:1.16 (pour push securisé après docker login)
    docker tag nginx:1.16 dockregistry.mycompany.fun/nginx:1.16

    docker push dockregistry.mycompany.fun/image:tag
    exemple:
        docker push dockregistry.mycompany.fun:4443/nginx:1.16
        docker pull dockregistry.mycompany.fun/image:tag

===================

NB: besoin (depuis futur client) de
docker login -uregistry-sa -pregistry-pwd dockregistry.mycompany.fun
que si
    -e REGISTRY_AUTH=htpasswd \
    -e REGISTRY_AUTH_HTPASSWD_PATH=/etc/security/htpasswd \
    -e REGISTRY_AUTH_HTPASSWD_REALM='Registry Realm' 
au lancement du conteneur docker (image registry:2)