#!/bin/bash


# killall -9 /usr/local/bin/sov_show.sh
# killall -9 /usr/local/bin/sov_hide.sh

echo "1" > /tmp/sovpipe
echo "1" > /tmp/sovstatus

# echo "sent 1 to sovpipe. checking if sovstatus file exits..."

# if [ -f /tmp/sovstatus ]; then
#  echo "sovstatus does exist already. removing and recreating."
#  rm /tmp/sovstatus
# fi

# echo "generating sov status file now"
# touch /tmp/sovstatus
# echo "1" > /tmp/sovstatus
# echo "set value of 1 in new sovstatus file."

exit
