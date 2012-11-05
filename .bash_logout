#!/bin/bash
#mcabber auto-away - probably a Linux only solution as we use /proc
if [ -p .mcabber/mcabber.fifo ]; then
  MCABBER_PID=$(pgrep -u $USER mcabber)
  if [ -n $MCABBER_PID ]; then
    MCABBER_STY=$(cat /proc/$MCABBER_PID/environ | tr '\0' '\n' | grep '^STY=' | cut -d'=' -f2)

    if [ -n $MCABBER_STY ]; then
      if [ -z "$(screen -list | grep $MCABBER_STY.*\(Attached\))" ]; then
        echo "/na ich beobachte diesen Client gerade nicht" > .mcabber/mcabber.fifo
      fi 
    fi
  fi
fi
