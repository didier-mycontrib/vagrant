#theses certificates will be copied in /srv/registry/security

#Store domain and intermediate certificates 
#using /srv/registry/security/registry.crt file,
# private key using /srv/registry/security/registry.key file. 
#Use valid certificate and do not waste time with self-signed one. 
#This step is required do use basic authentication.

# self-signed can be used with restrictions (for testing).
# the public generated certicate should be copied in all docker client
# for real certificate : -days 365
# -subj for non interactive/prompt mode
# -days 3650 (10 years) & hostname=cn=dockregistry.mycompany.fun
# are not serious settings (just for tests / Tp / POC ) .

mkdir -p certs
export MY_REGISTRY_HOST=dockregistry.mycompany.fun
#export SUBJ=/C=FR/O=mycompany/OU=DomainControlValidated/CN=dockregistry.mycompany.fun
#openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 3650 -subj "${SUBJ}" -out certs/domain.crt
sudo openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 3650 -config /vagrant/my-ca.conf -out certs/domain.crt

# NB: if "self-signed certificates" , you will need to copy certs/domain.crt
# on every host using docker and this private docker registry-pwd
cp certs/domain.crt /vagrant/domain.crt
cp certs/domain.crt /vagrant/dockregistry.mycompany.fun.crt

#NB: le fichier /vagrant/dockregistry.mycompany.fun.crt
#vu de l'extérieur (host windows) comme 
#vagrant/va-docker-registry/dockregistry.mycompany.fun.crt
#devra être recopié dans d'autres projets vagrant (clients vis à vis 
# de cette box/machine virtuelle)
#exemples (recopies dans ):
#vagrant/va-docker-integration/dockregistry.mycompany.fun.crt (for push)
#vagrant/va-private-cloud-master/dockregistry.mycompany.fun.crt (for pull)


#exemple sur autre ubuntu/debian? host (futur client vis à vis de ce projet):
# sudo cp /vagrant/dockregistry.mycompany.fun.crt /usr/local/share/ca-certificates/dockregistry.mycompany.fun.crt
# sudo update-ca-certificates
sudo mkdir /etc/docker/certs.d/dockregistry.mycompany.fun
sudo cp /vagrant/dockregistry.mycompany.fun.crt /etc/docker/certs.d/dockregistry.mycompany.fun/ca.crt
sudo cp /vagrant/dockregistry.mycompany.fun.crt /usr/local/share/ca-certificates/dockregistry.mycompany.fun.crt
sudo update-ca-certificates
sudo service docker restart

#checking certificate signing request: openssl req -text -noout -verify -in CSR.csr
#Check a private key:
sudo openssl rsa -in certs/domain.key -check
#Check a certificate:
sudo openssl x509 -in /vagrant/dockregistry.mycompany.fun.crt -text -noout

#Check an SSL connection. All the certificates (including Intermediates) should be displayed
#sudo openssl s_client -connect www.paypal.com:443

#exemple sur autre redhat/centos? host (futur client vis à vis de ce projet):
# cp /vagrant/dockregistry.mycompany.fun.crt /etc/pki/ca-trust/source/anchors/dockregistry.mycompany.fun.crt
# update-ca-trust 

#sudo hostnamectl set-hostname ${MY_REGISTRY_HOST}
hostname