#!/bin/bash

# Variables
NAGIOS_USER=nagiosadmin
NAGIOS_PASS=nagios

# Install dependencies
apt update
apt install -y autoconf gcc make apache2 php libapache2-mod-php php-gd libgd-dev unzip wget daemon

# Create Nagios user
useradd nagios
usermod -a -G nagios www-data

# Install Nagios Core
cd /tmp
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.5.9.tar.gz
tar zxvf nagios-4.5.9.tar.gz
cd nagios-4.4.14
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install
make install-init
make install-commandmode
make install-config
make install-webconf

# Create web UI login
htpasswd -b -c /usr/local/nagios/etc/htpasswd.users $NAGIOS_USER $NAGIOS_PASS

# Enable Apache modules and restart
a2enmod cgi
systemctl restart apache2

# Install Nagios Plugins
cd /tmp
wget https://nagios-plugins.org/download/nagios-plugins-2.4.9.tar.gz
tar zxvf nagios-plugins-2.4.9.tar.gz
cd nagios-plugins-2.4.9
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install

# Enable Nagios service
systemctl enable nagios
systemctl start nagios

# Basic monitoring of remote servers (ping check)
cat <<EOF >> /usr/local/nagios/etc/servers/entreprise.cfg
define host {
  use             linux-server
  host_name       srv-ad-dns-dhcp
  alias           AD DNS DHCP
  address         192.168.1.2
}

define host {
  use             linux-server
  host_name       srv-file
  alias           Serveur de fichiers
  address         192.168.1.3
}

define host {
  use             linux-server
  host_name       srv-tickets
  alias           Apache Ticket
  address         192.168.1.4
}

define host {
  use             linux-server
  host_name       srv-intranet
  alias           NGINX Intranet
  address         192.168.1.5
}

define host {
  use             windows-server
  host_name       srv-wsus
  alias           Serveur WSUS
  address         192.168.1.6
}

define host {
  use             windows-server
  host_name       srv-bdd
  alias           MySQL RH
  address         192.168.1.7
}

define service {
  use                     generic-service
  host_name               ad_dns_dhcp
  service_description     Ping
  check_command           check_ping!100.0,20%!500.0,60%
}
EOF

# Enable config directory
mkdir -p /usr/local/nagios/etc/servers
echo "cfg_dir=/usr/local/nagios/etc/servers" >> /usr/local/nagios/etc/nagios.cfg

# Restart Nagios to apply config
systemctl restart nagios
