#!/bin/bash
while true
do
    clear;
    echo "Posts:";
    grep "POST" /var/log/nginx/localhost.access_log | grep -v '] "GET'| grep `date +"/%b/%Y"`| grep -v "POST /admin/" | grep -v " 499 " | grep -v " 403 " | grep -v "217.18.180.50" | grep -v '" 404 ' | tail -n 60;
    sleep 300;
done;
