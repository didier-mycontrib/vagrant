docker tag mybasic/helloworld dockregistry.mycompany.fun/mybasic/helloworld
docker image ls
#docker login -uregistry-sa -pregistry-pwd dockregistry.mycompany.fun
docker push dockregistry.mycompany.fun/mybasic/helloworld
#curl -u registry-sa:registry-pwd -v https://dockregistry.mycompany.fun/v2/_catalog
curl -v https://dockregistry.mycompany.fun/v2/_catalog