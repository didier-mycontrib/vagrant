installation de "rancher 2" sur va-private-cloud-master
----------------------------------
 4Go mini recommandé en prod (1Go suffit pour tests)
 sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 
       -v /var/lib/rancher:/var/lib/rancher rancher/rancher
 
 https://private-cloud-master.mycompany.fun:443 
 ou http://192.168.33.30:443 (depuis autre vm/box)
 https://localhost:5443 (depuis host)
-------------------
via la console (https://localhost:5443)
- ignorer warning ssh (certificates)
- choose password for admin user at first connexion : admin

- fixer l'url du rancher-master qui devra être vue depuis
 tous les ranchers-workers ( https://adress_ip_or_.. ):
 (ex:  https://private-cloud-master.mycompany.fun
       https://192.168.33.30 )
- créer un nouveau cluster (ex: "ca") en mode "custom"
  générer 2 (ou +) de commandes (à copier/coller) pour initialiser des noeuds dans le cluster
  puis "save" ensuite.

Attention: pour chaque noeud il faut bien configurer:
   type (--etcd --controlplane , --worker , --etcd --controlplane --worker)
   adress (ex: 192.168.33.33) et éventuellement internal-address (ex: 192.168.33.33)
   et éventuellement node-name (ex: va-private-cloud-manager ou ...)  
==> 
  commande pour initialiser un nouveau noeud de type "etcd + control pane (kubernates manager) + worker":
  ==>
  sudo docker run -d --privileged --restart=unless-stopped --net=host 
  -v /etc/kubernetes:/etc/kubernetes 
  -v /var/run:/var/run rancher/rancher-agent:v2.3.4 
  --server https://192.168.33.30 
  --token xjgrqqhjl68wq2rg4vjng5l4x9wgww8d257mpc7zv9d8vkclrhb2wb 
  --ca-checksum cfcbb0b63f3482da8016c41191f44a4f4debec244d318c94b8357c069555c4f4 
  --node-name va-private-cloud-manager --address 192.168.33.33 
  --internal-address 192.168.33.33 --etcd --controlplane --worker

  commande pour initialiser nouveau noeud (de type worker):
  ==>
  sudo docker run -d --privileged --restart=unless-stopped --net=host 
  -v /etc/kubernetes:/etc/kubernetes 
  -v /var/run:/var/run rancher/rancher-agent:v2.3.4 
  --server https://192.168.33.30 
  --token xjgrqqhjl68wq2rg4vjng5l4x9wgww8d257mpc7zv9d8vkclrhb2wb 
  --ca-checksum cfcbb0b63f3482da8016c41191f44a4f4debec244d318c94b8357c069555c4f4 
  --node-name va-private-cloud-worker-a 
  --address 192.168.33.31 --internal-address 192.168.33.31 --worker

-------------------
ordre conseillé:
- initialiser vm/box "rancher" (master)
- initialiser vm/box "kubernates-manager" (--etcd --controlplane , avec agent rancher)
- initialiser en dernier vm/box "kubernates-workers" (--worker only , avec agent rancher)

-------------------
worker nodes (2 à 4Go mini ?) , (6cpu , 16Go advised for production)
(autre machine physique ou autre machine virtuelle
 --> ex: 192.168.33.33 va-private-cloud-manager)
Disable the firewall: (otherwise networking between nodes may fail)
sudo ufw disable or ???? 
Install basic software for clock synchronization:
sudo apt install -y ntp
run command avec --etcd --controlplane  (copier/coller) plus haut.  

-------------------
worker nodes (2 à 4Go mini ?) , (6cpu , 16Go advised for production)
(autre machine physique ou autre machine virtuelle
 --> ex: 192.168.33.31 va-private-cloud-worker-a)
Disable the firewall: (otherwise networking between nodes may fail)
sudo ufw disable or ???? 
Install basic software for clock synchronization:
sudo apt install -y ntp
run command avec --worker (copier/coller) plus haut.



