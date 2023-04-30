#!/bin/bash

killall -9 /usr/local/bin/sov_hide.sh
killall -9 /usr/local/bin/sov_show.sh

if [ -f /tmp/sovstatus ]; then
  echo "sovstatus file found. Reading.."
  sovstatus=`cat /tmp/sovstatus`
  echo "sovstatus read and was $sovstatus"
  if [[ $sovstatus -eq 1 ]]; then
    echo "initiating refresh:"
    echo 0 > /tmp/sovpipe
    echo "sent 0 to sovpipe, now waiting.."
    sleep 10
    echo 1 > /tmp/sovpipe
    echo "sent 1 to sovpipe"
  fi
 echo "exited refresh loop"
fi

echo "exited main loop, quitting now."
exit
