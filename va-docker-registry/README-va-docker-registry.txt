Ce projet vagrant permet de configurer et démarrer une nouvelle box
- en partant de la box fabriquée par va-base 
  "../my-boxes/with-docker-java-node.box"
  (linux ubuntu 18.4 64bits avec git, sudo, nano + docker + jdk/maven  + node/npm)
- with hostname=dockregistry.mycompany.fun (ssl CN)
- en provisionant l'image docker "registry:2"
- en initialisant un compte d'accès ssl pour basic auth
  (username=registry-sa,password=registry-pwd)
- en démarrant ( --restart always ) le conteneur docker
  correspondant à un "secure private docker registry" .
=====================
Configuration réseau "vagrant":
  config.vm.network "forwarded_port", guest: 443  host: 443 
  config.vm.network "private_network", type: "dhcp"
Configuration réseau du conteneur docker "registry":
  docker run --network host  ... -d registry:2
--> https://localhost:443 depuis la machine hôte.
=====================
Utilisée de l'extérieur, cette machine virtuelle , fera office de 
référentiel d'images "docker" (push et pull)
====================
depuis autre box:
 1) recopier et installer le certificat dockregistry.mycompany.fun.crt
 2) adapter (si besoin,si pas plugin hostmanager) etc/hosts via sudo nano
    (exemple: 172.28.128.1   dockregistry.mycompany.fun)
 3) test via :
    curl -u admin:password -v -X GET http_or_https://ip_address:5000_or_443/v2/_catalog
    exemple:
      curl -u registry-sa:registry-pwd -v -X GET http://dockregistry.mycompany.fun:5000/v2/_catalog 
      curl -u registry-sa:registry-pwd -v -X GET https://dockregistry.mycompany.fun:443/v2/_catalog

    docker login -uregistry-sa -pregistry-pwd dockregistry.mycompany.fun
    docker tag image:tag dockregistry.mycompany.fun/image:tag
    (inverse/unttagued via docker image rm dockregistry.mycompany.fun/image:tag)
    exemple:
    docker tag nginx:1.16 dockregistry.mycompany.fun/nginx:1.16

    docker push dockregistry.mycompany.fun/image:tag
    exemple:
        docker push dockregistry.mycompany.fun/nginx:1.16
        docker pull dockregistry.mycompany.fun/image:tag

===================

NB: besoin (depuis futur client) de
docker login -uregistry-sa -pregistry-pwd dockregistry.mycompany.fun
que si
    -e REGISTRY_AUTH=htpasswd \
    -e REGISTRY_AUTH_HTPASSWD_PATH=/etc/security/htpasswd \
    -e REGISTRY_AUTH_HTPASSWD_REALM='Registry Realm' 
au lancement du conteneur docker (image registry:2)