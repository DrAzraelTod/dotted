#!/bin/bash
while [ 1 ]
do
  clear;
  echo "Last 404s:";
  grep -i " 404 " /var/log/nginx/localhost.access_log |  grep  `date +"/%b/%Y"` |  grep -v ' "-" "-"' | grep -v "favicon.ico" | grep -v "robots.txt" | grep -v "apple-touch-icon" | grep -v ' "-" "Java' | grep -v ' "-" "libwww' | grep -v "217.18.180.50" | grep -v '/admin/' | grep -v ' "-" "ZmEu"' | grep -v "linkbutler.de/" | grep -v ' "-" "Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5' | grep -v 'CareerBot/' | grep -v 'AhrefsBot/'| grep -v " SISTRIX Crawler"  |tail -n 70;
  sleep 200;
done
