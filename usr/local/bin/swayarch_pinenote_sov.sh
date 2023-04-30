#!/bin/bash

current=`cat /tmp/sovpipe`

if [ $current -eq 1 ]; then
	echo 0 > /tmp/sovpipe

else
	echo 1 > /tmp/sovpipe
fi
