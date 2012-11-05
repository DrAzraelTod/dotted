#!/bin/bash
echo -n "entry" >> ~/mcabber.log
if [ "$1" = "STATUS" ]; then
   DATE=`ddate +"%{%A, the %e of %B%}, %Y. %N%nCelebrate %H"`;
   TIME=`date +'%s'`;
#   if [ "$2" == "_" ]; then
#     grep -v "$3;_" ~/mcabber.test > ~/mcabber.temp;
#     echo 'grep -v "$3;_" ~/mcabber.test > ~/mcabber.test;';
#   else
     grep -v "$3" ~/mcabber.test > ~/mcabber.temp;
#     echo 'grep -v "$3" ~/mcabber.test > ~/mcabber.test;';
#   fi;
   echo "$3;$2;$DATE;$TIME" >> ~/mcabber.temp;
   mv ~/mcabber.temp ~/mcabber.test;
   echo "$1 $2 $3 $4" >> ~/mcabber.log;
fi;