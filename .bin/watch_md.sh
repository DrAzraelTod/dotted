#!/bin/bash
clear;
pandoc -f markdown -s $1 > $1.html;
lynx --dump $1.html;
rm $1.html;
while true
do
  change=$(inotifywait -e close_write,moved_to,create -q .)
  change=${change#./ * }
  if [ "$change" = $1 ]; then
  clear;
  pandoc -f markdown -s $1 > $1.html;
  lynx --dump $1.html;
  rm $1.html;
  sleep 1;
  fi;
done;
