echo "192.168.33.20 va-docker-registry dockregistry.mycompany.fun" | sudo tee -a /etc/hosts
echo "192.168.33.30 va-private-cloud-master private-cloud-master.mycompany.fun" | sudo tee -a /etc/hosts
echo "192.168.33.33 va-private-cloud-manager private-cloud-manager.mycompany.fun" | sudo tee -a /etc/hosts
echo "192.168.33.31 va-private-cloud-worker-a private-cloud-worker-a.mycompany.fun" | sudo tee -a /etc/hosts
echo "192.168.33.32 va-private-cloud-worker-b private-cloud-worker-b.mycompany.fun" | sudo tee -a /etc/hosts

#because self signed certificate

#Check a certificate:
sudo openssl x509 -in /vagrant/dockregistry.mycompany.fun.crt -text -noout

#Check an SSL connection. All the certificates (including Intermediates) should be displayed
#sudo openssl s_client -connect www.paypal.com:443


sudo mkdir -p /etc/docker/certs.d/dockregistry.mycompany.fun
sudo cp /vagrant/dockregistry.mycompany.fun.crt /etc/docker/certs.d/dockregistry.mycompany.fun/ca.crt
sudo cp /vagrant/dockregistry.mycompany.fun.crt /usr/local/share/ca-certificates/dockregistry.mycompany.fun.crt
sudo update-ca-certificates
sudo service docker restart

#test connexion ssl
#sudo openssl s_client -connect dockregistry.mycompany.fun:443

#---- exemples ----
#curl -u registry-sa:registry-pwd -v -X GET https://dockregistry.mycompany.fun:443/v2/_catalog
#docker tag nginx:1.16 dockregistry.mycompany.fun/nginx:1.16
#docker login -uregistry-sa -pregistry-pwd dockregistry.mycompany.fun
#docker push_or_pull dockregistry.mycompany.fun/nginx:1.16