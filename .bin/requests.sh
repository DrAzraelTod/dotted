#!/bin/bash
while [ 1 ]
do
  clear;
  echo "Requests:"
  grep `date +"%d/%b/%Y"` /var/log/nginx/localhost.access_log |
	grep -v Googlebot |
	grep -v ' \"-\" \"-\"'  |
	grep -v slurp |
	grep -v WordPress |
	grep -v 'GET /feed/' |
	grep -v 'GET /admin' |
	grep -v 'GET /favicon.ico HTTP' |
	grep -v 'GET /apple-touch-icon'|
	grep -iv 'Crawler' |
	grep -iv 'spider' |
	grep -v ' 404 ' |
	grep -iv '/bot' |
	grep -iv '/robot' |
	grep -v "178.25.111.150" |
	grep -v ' "-" "Java/' |
	grep -v '" 404 '|
	grep -v ' "-" "Ruby"' |
	grep -v ' "-" "Twitterbot/1.0"' |
	grep -v "Bot 1." |
	grep -v "Bot 2." | 
	grep -v "Bot/1." |
	grep -v "Bot/2."| 
	grep -v ".bot@" | 
	grep -v ' "-" "msnbot'|
	grep -v ' "-" "Unwind' | 
	grep -v ' "-" "MLBot (www.metadatalabs.com/mlbot)"' | 
	grep -v ' "-" "Reeder/' | 
	grep -v ' "-" "Tiny Tiny RSS/' |
	grep -v ' "-" "linkdex.com/'|
	grep -v ' "-" "Mozilla/4.0 (compatible;)"' |
	grep -v 'topsy.com/butterfly' |
	grep -v '"Python-urllib' |
	grep -iv 'findlinks' |
	grep -v ' "-" "Mozilla/5.0 (compatible; bingbot/' |
	grep -v ' "-" "Mozilla/5.0 (compatible; TweetmemeBot/' |
	grep -v ' "-" "Mozilla/5.0 Moreover/' |
    tail -n 50;
  sleep 60;
done;
