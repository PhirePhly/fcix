#!/bin/bash
#
# Kenneth Finnegan, 2018

cd routeserver

source ~/.virtualenv/arouteserver/bin/activate

arouteserver html -o ../www/rs-policy.html --cfg ./arouteserver.yml

