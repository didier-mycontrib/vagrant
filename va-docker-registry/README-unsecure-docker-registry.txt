NB: docker registry:2 (server side)
have :
  - usecure http access (:5000)
  - secure https access (:443) need config (certificates, ...)

=================
In order to access (client side) to the remote docker registry
in unsecure mode , the folowing tasks should be done on client host
(ex: va-docker-integration)

sudo nano /etc/docker/daemon.json
{
  "insecure-registries" : ["dockregistry.mycompany.fun:5000"]
}

test:
docker push dockregistry.mycompany.fun:5000/nginx:1.16
(after tagging docker image)
