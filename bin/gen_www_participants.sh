#!/bin/bash

cat www/_participants.md >www/participants.md

tail -n +2 participants.tsv | \
awk -F '\t' '{print $2 " | [" $3 "](http://peerwith.me/" $3 ") | 206.80.238." $1 " | 2001:504:91::" $1 }' >>www/participants.md

echo "Route Server 1 | [33495](http://peerwith.me/33495) | 206.80.238.253 | 2001:504:91::253" >>www/participants.md
echo "Route Server 2 | [33495](http://peerwith.me/33495) | 206.80.238.254 | 2001:504:91::254" >>www/participants.md
