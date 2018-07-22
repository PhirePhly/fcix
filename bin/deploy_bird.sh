#!/bin/bash
#
# deploy_bird
# Kenneth Finnegan, 2018
#
# This script generates all of the bird config files on the jump box and
# copies them to all of the route servers over the out-of-band subnet

SRC_DIR=/home/kenneth/src/fcix

cd $SRC_DIR
git pull
make conf

if bird -p -c $SRC_DIR/routeserver/RS1.bird.conf; then
	scp $SRC_DIR/routeserver/RS1.bird.conf rs1:~/bird.conf
	scp $SRC_DIR/routeserver/RS1.bird.conf test-rs1:~/bird.conf
fi
if bird -p -c $SRC_DIR/routeserver/RS2.bird.conf; then
	scp $SRC_DIR/routeserver/RS2.bird.conf rs2:~/bird.conf
	scp $SRC_DIR/routeserver/RS2.bird.conf test-rs2:~/bird.conf
fi

if bird6 -p -c $SRC_DIR/routeserver/RS1.bird6.conf; then
	scp $SRC_DIR/routeserver/RS1.bird6.conf rs1:~/bird6.conf
	scp $SRC_DIR/routeserver/RS1.bird6.conf test-rs1:~/bird6.conf
fi
if bird6 -p -c $SRC_DIR/routeserver/RS2.bird6.conf; then
	scp $SRC_DIR/routeserver/RS2.bird6.conf rs2:~/bird6.conf
	scp $SRC_DIR/routeserver/RS2.bird6.conf test-rs2:~/bird6.conf
fi


