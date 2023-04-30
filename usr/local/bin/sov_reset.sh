#!/bin/bash


WHICHTAIL="sov"

TARGET=$(pgrep --list-full tail | grep $WHICHTAIL | awk '{print $1}')

echo "target = $TARGET"

kill -n 9 $TARGET ; killall sov ; rm -f /tmp/sovpipe ; mkfifo /tmp/sovpipe && tail -f /tmp/sovpipe | sov
