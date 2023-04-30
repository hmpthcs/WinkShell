#!/bin/bash

grim -g "$(slurp)" - | wl-copy ; rnote & sleep 5 ; wtype -M ctrl -k v -m ctrl ; exit
