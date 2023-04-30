#!/bin/bash

sovcurrent=`cat < /tmp/sovstatus`
echo "/tmp/sovstatus read as: $sovcurrent"

# if [ -f /tmp/sovstatus ]; then
#  sovcurrent=`cat < /tmp/sovstatus`
#  echo "/tmp/sovstatus file found. sovcurrent variable read and set internally to $sovcurrent"
# else
#  echo "/tmp/sovstatus not found; setting sovcurrent to 0"
#  sovcurrent=0
# fi &&

if [ $sovcurrent -eq 0 ]; then
  exec "/usr/local/bin/sov_show.sh"
  echo "executed sov_show.sh"
else [ $sovcurrent -eq 1] then 
  exec "/usr/local/bin/sov_hide.sh"
  echo "executed sov_hide.sh"
fi
