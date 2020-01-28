#install nginx (for reverse-proxy)
##############################
sudo apt-get -y install nginx

#sudo nano /etc/nginx/sites-available/reverse-proxy.conf

#ajusting (variable) port of kubernates/minikube dashboard
#server {
#    listen 8787;
#    location / {
#        proxy_pass http://127.0.0.1:43845;
#    }
#}
#ajusting (variable) port of app (served by) bukernates
#server {
#    listen 8888;
#    location / {
#        proxy_pass http://127.0.0.1:30188;
#    }
#}

#sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
#sudo service nginx restart