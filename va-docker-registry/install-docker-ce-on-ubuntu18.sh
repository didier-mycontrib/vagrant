#remove old version of docker :
sudo apt-get -y remove docker docker-engine docker.io

# necessary packages to allow the use of Docker’s repository :
sudo apt install apt-transport-https ca-certificates curl software-properties-common
#download and verify fingerprint :
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
#Add the stable Docker repository:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#install docker-ce :
sudo apt-get update
sudo apt-get -y install docker-ce
#Add your limited Linux user account to the docker group:
sudo usermod -aG docker vagrant


