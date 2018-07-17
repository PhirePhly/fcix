#!/bin/bash
#
# Kenneth Finnegan, 2018

cd routeserver

source ~/.virtualenvs/arouteserver/bin/activate

arouteserver html -o ../www/rs-policy.html --cfg ./arouteserver.yml

