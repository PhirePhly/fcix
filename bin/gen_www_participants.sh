#!/bin/bash

cat www/_participants.md >www/participants.md

tail -n +2 participants.tsv | \
awk -F '\t' '{print $2 " | [" $3 "](http://peerwith.me/" $3 ") | 44.74.128." $1 " | 2607:7C80:55:128::" $1 }' >>www/participants.md

echo "Router Server 1 | 4244741280 | 44.74.128.253 | 2607:7C80:55:128::253" >>www/participants.md
echo "Router Server 2 | 4244741280 | 44.74.128.254 | 2607:7C80:55:128::254" >>www/participants.md
