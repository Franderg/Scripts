#!/bin/bash

##########################
# Variables              #
##########################

INSTALL='sudo install --owner=root --group=root --mode=644'


##########################
# Check permissions      #
##########################

# Check for permissions errors
if [ `id -u` == 0 ]; then
    echo "[ERROR] This script should not be executed as root. Run it a a sudo-capable user."
    exit 1
fi

# Check if user can do sudo
echo "Se necesitan permisos de administrador"
if [ `sudo id -u` != 0 ]; then
    echo "This user cannot cast sudo or you typed an incorrect password (several times)."
    exit 1
else
    echo "Correctly authenticated."
fi

echo "Se agregan backports"
sudo su -c "echo 'deb http://ftp.debian.org/debian jessie-backports main contrib non-free' >> /etc/apt/sources.list.d/jessie-backports.list"
echo "Se realiza update" 
sudo apt-get update
echo "Se instalan paquetes necesarios" 
sudo apt-get install python3-pip python-pip python3-venv -t jessie-backports
sudo pip3 install requests --upgrade  # apt-get install python-requests
sudo pip3 install lxml --upgrade      # apt-get install python-lxml
sudo pip3 install urllib3 --upgrade   # apt-get install python-urllib3
sudo pip3 install python-telegram-bot --upgrade
sudo pip3 install watson-developer-cloud --upgrade
echo "Instalación terminada con éxito :)"
