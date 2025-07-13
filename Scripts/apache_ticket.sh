#!/bin/bash
apt-get update
apt-get install -y apache2 php libapache2-mod-php
systemctl enable apache2
echo "<?php phpinfo(); ?>" > /var/www/html/index.php
