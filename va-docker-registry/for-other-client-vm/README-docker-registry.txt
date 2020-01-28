pour autres vm avec docker devant se connecter vers va-docker-registry
(vu comme hostname=dockregistry.mycompany.fun) 
=========================
recopier dockregistry.mycompany.fun.crt
       et add_dockregistry_certificate.sh
à la racine d'une autre box "vagrant" utilisant docker 
et lancer le scipt suivant via vagrant ssh (apres vagrant up):

cd /vagrant
./add_dockregistry_certificate.sh

======
verif via :

curl -u registry-sa:registry-pwd -v  https://dockregistry.mycompany.fun:443/v2/_catalog
ou bien 
curl -v  https://dockregistry.mycompany.fun:443/v2/_catalog