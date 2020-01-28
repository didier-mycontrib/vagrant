#Create a directory to permanently store images.
sudo mkdir -p /srv/registry/data

#Create a directory to permanently store certificates and authentication data.
sudo mkdir -p /srv/registry/security

#Store domain and intermediate certificates 
#using /srv/registry/security/registry.crt file,
# private key using /srv/registry/security/registry.key file. 
# certs/domain.crt & certs/domain.key may be built via
# previous script prepare-domain-ssl-certificates.sh

# original version with fresh generated crt & key :
# cp certs/domain.crt /srv/registry/security/registry.crt
# mv certs/domain.key /srv/registry/security/registry.key

####
## if new/fresh version is wanted:
# cp /vagrant/new-generated-certs/registry.key /vagrant/for-this-vm/registry.key
# cp /vagrant/dockregistry.mycompany.fun.crt /vagrant/dockregistry.mycompany.fun.crt


# new version with old generated crt & key :
cp /vagrant/dockregistry.mycompany.fun.crt /srv/registry/security/registry.crt
cp /vagrant/for-this-vm/registry.key /srv/registry/security/registry.key

#Install apache2-utils to use htpasswd utility.
sudo apt-get update
sudo apt-get -y install apache2-utils

#Create initial username and password (username=registry-sa, password=registry-pwd)
#The only supported password format is bcrypt.
#init htpasswd file :
: | sudo tee /srv/registry/security/htpasswd
#Adding password "registry-pwd" for user registry-sa :
echo "registry-pwd" | sudo htpasswd -iB /srv/registry/security/htpasswd registry-sa

#verify content of htpasswd file :
cat /srv/registry/security/htpasswd


