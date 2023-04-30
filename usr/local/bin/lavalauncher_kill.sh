#!/bin/bash

# echo "1 = $1"

while getopts f: flag
do
    case "${flag}" in
        f) WHICHLAVA=${OPTARG};;
    esac
done

echo "whichlava = $WHICHLAVA"


TARGET=$(pgrep --list-full lavalauncher | grep $WHICHLAVA | awk '{print $1}')

echo "target = $TARGET"

kill -n 9 $TARGET
