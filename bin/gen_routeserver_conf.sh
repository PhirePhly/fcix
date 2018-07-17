#!/bin/bash
#
# Kenneth Finnegan, 2018

cd routeserver

source ~/.virtualenvs/arouteserver/bin/activate
arouteserver bird --ip-ver 4 -o RS1.bird.conf --cfg ./arouteserver.yml
arouteserver bird --ip-ver 6 -o RS1.bird6.conf --cfg ./arouteserver.yml

sed -i '/router id 206.80.238.253;/router id 206.80.238.253;/' <RS1.bird.conf >RS2.bird.conf
sed -i '/router id 206.80.238.253;/router id 206.80.238.253;/' <RS1.bird6.conf >RS2.bird6.conf

