#NB: le jdk (java) doit avoir ete préalablement installé / provisionné
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins

#add jenkins user in docker group
sudo usermod -a -G docker jenkins

#start jenkins
sudo systemctl start jenkins
#verification:
sudo systemctl status jenkins

#parametrage du firewall:
sudo ufw allow 8080
sudo ufw status

#read initial admin pwd in 
#sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#(ex: 2f99e901b73d4ded8826c3de581394fa)

#http://localhost:8989 (selon config vagrant)

#--------------------
#Au premier démarrage , spécifier le mot de passe d'activation/déblocage
#choisir quelques "plugins" 
#et spécifier le compte d'admin (ex: admin/admin )
#choisir l'url de jenkins (ex: http://localhost:8989/ 
# ou http://dockintegration.mycompany.fun:8989/  ou http://localhost:8989/jenkins ??? )
# ceci pour reverse-proxy interne ? , peut se reconfigurer via admin / system