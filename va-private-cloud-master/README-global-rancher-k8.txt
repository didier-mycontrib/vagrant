Configuration "Rancher/test/vm vagrant (private network)"
========================================================

va-private-cloud-master = master "rancher" (1Go suffit pour tests)
--------------------------------------------------
--> vision externe (depuis host windows , avec vagrant) :
   http://localhost:5443 (admin/admin)
--> vision interne (réseau privé vagrant/virtual_box) : 
   http://192.168.33.30:443
----------------------------------------------

va-private-cloud-manager = kubernates "manager (--etcd , --controlplane) 
  + --worker eventuellement " (4Go ok pour tests , 2Go ???)
--------------------------------------------------
--> vision interne (réseau privé vagrant/virtual_box) : 
   http://192.168.33.33
----------------------------------------------

va-private-cloud-worker-a = kubernates "--worker" (4Go ok pour tests , 2Go ???)
--------------------------------------------------
--> vision interne (réseau privé vagrant/virtual_box) : 
   http://192.168.33.31
----------------------------------------------
 


