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

sudo tar -xzvf package.tar.gz

sudo rpm -ivh bzip2-devel-1.0.6-13.el7.x86_64.rpm
sudo rpm -ivh kernel-headers-3.10.0-862.14.4.el7.x86_64.rpm
sudo rpm -ivh keyutils-libs-devel-1.5.8-3.el7.x86_64.rpm
sudo rpm -ivh pcre-devel-8.32-17.el7.x86_64.rpm
sudo rpm -ivh mpfr-3.1.1-4.el7.x86_64.rpm
sudo rpm -ivh libmpc-1.0.1-3.el7.x86_64.rpm
sudo rpm -ivh cpp-4.8.5-36.el7.x86_64.rpm
sudo rpm -ivh zlib-1.2.7-18.el7.x86_64.rpm 
sudo rpm -ivh zlib-devel-1.2.7-18.el7.x86_64.rpm
sudo rpm -ivh glibc-2.17-260.el7.x86_64.rpm
sudo rpm -ivh glibc-headers-2.17-260.el7.x86_64.rpm
sudo rpm -ivh glibc-devel-2.17-260.el7.x86_64.rpm
sudo rpm -ivh libverto-devel-0.2.5-4.el7.x86_64.rpm
sudo rpm -ivh libffi-devel-3.0.13-18.el7.x86_64.rpm 
sudo rpm -ivh libsepol-2.5-10.el7.x86_64.rpm 
sudo rpm -ivh libsepol-devel-2.5-10.el7.x86_64.rpm
sudo rpm -ivh libgomp-4.8.5-36.el7.x86_64.rpm
sudo rpm -ivh gcc-4.8.5-36.el7.x86_64.rpm
sudo rpm -ivh openssl-libs-1.0.2k-16.el7.x86_64.rpm
sudo rpm -ivh openssl-1.0.2k-16.el7.x86_64.rpm
sudo rpm -ivh libselinux-2.5-14.1.el7.x86_64.rpm
sudo rpm -ivh libselinux-devel-2.5-14.1.el7.x86_64.rpm
sudo rpm -ivh libkadm5-1.15.1-34.el7.x86_64.rpm
sudo rpm -ivh libcom_err-devel-1.42.9-13.el7.x86_64.rpm
sudo rpm -ivh krb5-devel-1.15.1-34.el7.x86_64.rpm
sudo rpm -ivh openssl-devel-1.0.2k-16.el7.x86_64.rpm

echo "Removing rpm files"
rm *.rpm

sudo mv Python-3.7.2.tgz /usr/src
cd /usr/src
sudo tar xzf Python-3.7.2.tgz
cd Python-3.7.2
sudo ./configure --enable-optimizations --with-ensurepip=install
sudo make altinstall
sudo mv python python3.7
sudo ln -s python3.7 /usr/bin/python3.7
sudo rm /usr/src/Python-3.7.2.tgz

echo "Testing the version of python3.7"
python3.7 -V
echo "Installation successful"

echo "\nalias python='python3.7'" >> ~/.bashrc
