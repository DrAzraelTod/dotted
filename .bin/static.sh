#!/bin/bash
sudo chmod 644 /var/log/nginx/*;
sudo rm /var/log/nginx/*.gz;
while true
do
    clear;
    echo "Static:";
    less /var/log/nginx/static.access.log | grep -v .css | grep -v 93.159.98.161 |grep -v robots.txt | grep -v '/static/images/qr.png' | grep -v "static/admin_media/" | grep -v " 404 201 " | grep -v " /static/podcasts/";
    sleep 300;
done;
