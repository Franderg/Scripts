#!/bin/bash

echo "Type the name (with extension) of the file to be stamped"
read fileName
echo "Signing file to be uploaded"
echo | gpg --sign --armor $fileName
echo "Type the name of the desired certificate name"
read fileCert

#echo | openssl ts -query -data $fileName -cert | tee $fileCert.tsq | curl -s -S -H 'Content-Type: application/timestamp-query' --data-binary @- http://tsa.sinpe.fi.cr/tsaHttp/ -o $fileCert.tsr

echo | openssl ts -query -data $fileName -cert | tee $fileCert.tsq | curl -H 'Content-Type: application/timestamp-query' --data-binary @- http://tsa.sinpe.fi.cr/tsaHttp/ -o $fileCert.tsr

#echo "Where ir the *.pem certification file? (No '/' at the end)"
#read certPath

echo | openssl ts -verify -in $fileCert.tsr -data $fileName -CAfile /home/frander/CA.pem
