Deploiement d'application sur un cluster "rancher"
=================================================


Mode "découverte / pas à pas , premiers pas via kubectl " :
----------------------------------------------------------
- se connecter à la console rancher: http://localhost:5443 (admin/admin)
- sélectionner un cluster préalamblement configuré (ex: "ca") 
- cliquer sur "launch kubectl" de façon à faire apparaître la console texte
  intégrée à la console web "rancher" s'exécutant au sein du navigateur.
  Au sein de cette console texte (kubectl) , lancer les commandes suivantes:
  * kubectl create deployment hello-node --image=gcr.io/hello-minikube-zero-install/hello-node
       avec image prédéfinie tuto minikube ou bien avec image maison 
    kubectl create deployment hello-node --image=dockregistry.mycompany.fun/mybasic/helloworld
  * kubectl get deployments
    kubectl get events
    kubectl get pods
         ---> hello-node-5b8b99f4c8-v9kw5 ou autre

  * kubectl expose deployment hello-node --type=LoadBalancer --port=8080
    kubectl get services

  * kubectl exec -it <your_container_name> curl localhost
        --> kubectl exec -it hello-node-5b8b99f4c8-v9kw5 curl localhost:8080
               ---> affiche "Hello world!" si tout va bien
                    mais cela reste un accès interne !!!

  * kubectl delete service hello-node
  * kubectl delete deployment hello-node

Mode "workload via console rancher":
----------------
1) select cluster (ex: "ca")
2) select "Projects/Namespaces" .
3) open "Default" project.
4) select  "Workloads" & click "deploy".
5) * name=hello-workload or ...
   * docker image=dockregistry.mycompany.fun/mybasic/helloworld or ...
   # plus tard "Load-balancing / Add ingress ..."
-----------
6) revenir sur le niveau "cluster ca / Project default" .
   et sélectionner l'onglet "Load Balancing" .
7) Add Ingress ( name = "hello-ingress" or "hello" )
   Target Backend  
       choose a workload --> select "hello-workload" and port (ex: 80) interne?
   Save , wait few seconds    
   ---> http://hello.default.192.168.33.31.xip.io/
        censé être visible de l'extérieur du cluster "kubernates"
        mais selon contexte (ex: vm vagrant ou ...)
        adapation nécessaire ...


Mode automatisé:
----------------
