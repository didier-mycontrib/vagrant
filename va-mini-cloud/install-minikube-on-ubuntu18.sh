#install kubectl and minikube
##############################

#installation de kubectl via curl
#curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
#chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl
#kubectl version --client

#installation de kubectl via apt-get
#sudo apt-get update && sudo apt-get install -y apt-transport-https
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
#sudo apt-get update
#sudo apt-get install -y kubectl
#kubectl version --client

#NB: no install hypervisor "virtualbox" or "kvm" here
#because we are already in a virtualBox vm (via vagrant)
#==> minikube start with option --vm-driver=none and with sudo
#with this config , minikube runs with docker


#installation de minikube:
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube

#variante (à tester) pour installation de minikube:
#curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
#  && chmod +x minikube
#sudo mkdir -p /usr/local/bin/
#sudo install minikube /usr/local/bin/

#test installation de minikube:
#sudo minikube start --vm-driver=none
#sudo minikube status
#sudo minikube stop
# et si besoin : sudo minikube delete

#console 'dashboard" de minikube :
# sudo minikube dashboard --url &
# puis copier/coller l'url dans un navigateur web


# cat /proc/meminfo
# cat /proc/cpuinfo

