docker-compose build
docker-compose up
----------------
nginx sera ulisé en front pour securiser un peu les accès à 
kibana et elasticsearch
nginx aura 80 comme port interne et par exemple 8080 comme port externe
-----
http://localhost:8080 reroute vers kibana (port interne : 5601)
http://localhost:8080/api/es reroute 
      vers l'api rest de elastic search (port interne : 9200)
-------
au sein de docker-compose.yml ,
"net" correspond à un réseau docker permettant de faire fonctionner
ensemble les 3 conteneurs dockers "kibana" , "nginx" et "elasticsearch" .
"esdata" correpond à un volume docker (mappé sur /usr/share/elasticsearch/data
 de l'image elasticsearch) . Ceci pour effectuer d'éventuelles sauvegardes ou autres
----------
site source (inspiration): 
https://blogs.infinitesquare.com/posts/alm/creer-un-serveur-de-log-avec-docker-elastic-search-kibana-and-nginx-architecture-et-mise-en-place
