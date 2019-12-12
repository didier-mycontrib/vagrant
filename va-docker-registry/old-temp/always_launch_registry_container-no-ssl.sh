sudo docker run -d --network host --name "registry-container" -v /srv/registry/data:/var/lib/registry --restart always registry:2
#test (en local):
#docker pull hello-world
#docker tag hello-world localhost:5000/hello-world
#docker push localhost:5000/hello-world
#docker image ls
#docker image remove hello-world
#docker image remove localhost:5000/hello-world
#docker image ls
#docker pull localhost:5000/hello-world
#docker image ls
############"
#docker run --network host --name "nginx-container" -d nginx:1.16
#curl http://localhost:80