#!/bin/bash

#script para respaldo de directorio de datos del foro
#Realizado por Frander Granados V.
#email=fgranados@ic-itcr.ac.cr

d_ant=`date +%d-%m-%Y%A --date="-7 day"`

cd /var/www/IC/joomla/media/kunena
tar -zcvf $(date +%d-%m-%Y%A).tar.gz .
echo se crea archivo a respaldar
#se crea directorio en NAS 172.19.127.4
mkdir -p "directorio del NAS"/$(date +%d-%m-%Y%A)
mv $(date +%d-%m-%Y%A).tar.gz "directorio del NAS"/$(date +%d-%m-%Y%A)
echo se realiza respaldo de archivos

#crontab -e
#agregar al final
#0 1 * * * respaldoGinebra.sh

#Se eliminan respaldos de semanas anteriores, se excluyen los lunes.
echo se eliminan respaldos viejos
rm -R "directorio del NAS"/$(date +%d-%m-%Y%A --date="-7 day")
a=$(date +%A)
b="Monday"
if [[ $a != $b ]]; then
    rm -R "directorio del NAS"/$(date +%d-%m-%Y%A --date="-7 day")
    exit 1
fi










