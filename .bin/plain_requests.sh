#!/bin/bash
while [ 1 ]
do
  clear;
  echo "Requests:"
  tail -n 65 /var/log/nginx/localhost.access_log;
  sleep 10;
done;
