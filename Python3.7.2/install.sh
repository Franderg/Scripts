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

tar -xzvf package.tar.gz
rpm -ivh *.rpm
mv Python-3.7.2.tgz /usr/src
cd /usr/src
tar xzf Python-3.7.2.tgz
cd Python-3.7.2
./configure --enable-optimizations
make altinstall
mv python python3.7
ln -s python3.7 /usr/bin/python3.7
rm /usr/src/Python-3.7.0.tgz

echo "Testing the version of python3.7"
python3.7 -V
echo "Installation finaliced"

