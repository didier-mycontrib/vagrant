echo "192.168.33.30 va-private-cloud-master private-cloud-master.mycompany.fun" | sudo tee -a /etc/hosts
echo "192.168.33.33 va-private-cloud-manager private-cloud-manager.mycompany.fun" | sudo tee -a /etc/hosts
echo "192.168.33.31 va-private-cloud-worker-a private-cloud-worker-a.mycompany.fun" | sudo tee -a /etc/hosts
echo "192.168.33.32 va-private-cloud-worker-b private-cloud-worker-b.mycompany.fun" | sudo tee -a /etc/hosts
sudo apt-get install ntp
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.3.4 --server https://192.168.33.30 --token xjgrqqhjl68wq2rg4vjng5l4x9wgww8d257mpc7zv9d8vkclrhb2wb --ca-checksum cfcbb0b63f3482da8016c41191f44a4f4debec244d318c94b8357c069555c4f4 --node-name va-private-cloud-manager --address 192.168.33.33 --internal-address 192.168.33.33 --etcd --controlplane --worker