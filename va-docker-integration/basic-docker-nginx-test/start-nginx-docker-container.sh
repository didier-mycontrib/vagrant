docker run --network host --name "nginx-container" -v /vagrant/basic-docker-nginx-test/html:/usr/share/nginx/html:ro -d nginx:1.16