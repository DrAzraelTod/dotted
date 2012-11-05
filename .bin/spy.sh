#!/bin/bash
while [ 1 ]
do
  clear;
  less /var/log/nginx/static.access.log | grep -i ErikaSteinbach.png | tail -n 70;
  sleep 200;
done
