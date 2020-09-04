#!/bin/bash

# Update and download nginx
until sudo apt-get update && sudo apt install nginx --yes --force-yes;do
    sleep 1
done

# Modify Nginx Config to allow access to Vulnerable Web App


sudo touch /etc/nginx/conf.d/VulnerableWebApp.conf

sudo chmod a+w /etc/nginx/conf.d/VulnerableWebApp.conf

sudo cat <<EOT >> /etc/nginx/conf.d/VulnerableWebApp.conf
server {
  listen 80;
  listen [::]:80;
  server_name localhost;
  location / {
      proxy_pass http://localhost:8000/;
  }
}
EOT

sudo service nginx restart
sleep 2
sudo nginx -s reload

sudo python3 $dir/VulnerableWebApp/VulnerableWebApp/manage.py runserver &

