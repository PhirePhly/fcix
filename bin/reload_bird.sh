#!/bin/bash
#
# reload_bird.sh
# Kenneth Finnegan, 2018
#
# Given an updated set of configs from deploy_bird, copy them in place and
# send bird a hangup signal to load the new configs

SRC_DIR=/home/kenneth

if /usr/sbin/bird -p -c $SRC_DIR/bird.conf; then
        cp $SRC_DIR/bird.conf /etc/bird/bird.conf
        killall -s SIGHUP bird
fi
if /usr/sbin/bird6 -p -c $SRC_DIR/bird6.conf; then
        cp $SRC_DIR/bird6.conf /etc/bird/bird6.conf
        killall -s SIGHUP bird6
fi

