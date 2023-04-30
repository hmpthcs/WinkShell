#!/bin/bash

if [ $# -eq 0 ]
then
    echo ""
else

echo 0 > /tmp/sovpipe
echo 2 > /tmp/swovcp
swayr move-focused-to-workspace

fi

exit
