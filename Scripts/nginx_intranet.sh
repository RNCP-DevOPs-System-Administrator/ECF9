#!/bin/bash
apt update
apt install -y nginx
systemctl enable nginx
echo "<h1>Intranet Entreprise X</h1>" > /var/www/html/index.html
