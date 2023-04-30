#!/bin/bash


# killall -9 /usr/local/bin/sov_show.sh
# killall -9 /usr/local/bin/sov_hide.sh

echo "0" > /tmp/sovpipe
echo "0" > /tmp/sovstatus

# echo "sent 0 to sovpipe. checking if sov status file exists.."

# if [ -f /tmp/sovstatus ]; then
#  echo "sov status file does exist. removing"
#  rm /tmp/sovstatus
# fi

# echo "generating new status file"
# touch /tmp/sovstatus

# echo "0" > /tmp/sovstatus
# echo "set new status file value to 0"

exit
