#!/bin/bash
while [ 1 ]
do
  clear;
  echo "Hochzeit:"
  grep -i ' /hochzeit' /var/log/nginx/localhost.access_log | tail -n 70;
  sleep 10;
done;
