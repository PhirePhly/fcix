#!/bin/bash
#
# gen_routeserver_bgpd.sh - Generates bgpd config for route servers
# Kenneth Finnegan, 2018

cat <<EOF >conf/RS1.bgpd.conf
!
! Zebra configuration Generated on
!  `date`
!
hostname RS1
password zebra
log stdout
!
router bgp 4244741280
 bgp router-id 44.74.128.253
 no bgp default ipv4-unicast
EOF

cat <<EOF >conf/RS2.bgpd.conf
!
! Zebra configuration Generated on
!  `date`
!
hostname RS2
password zebra
log stdout
!
router bgp 4244741280
 bgp router-id 44.74.128.254
 no bgp default ipv4-unicast
EOF

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 44.74.128." $1 " remote-as " $3}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 44.74.128." $1 " description " $2}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 44.74.128." $1 " activate"}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 44.74.128." $1 " maximum-prefix " $4 * 2 + 1}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 44.74.128." $1 " route-server-client"}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 2607:7c80:55:128::" $1 " remote-as " $3}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 2607:7c80:55:128::" $1 " description " $2}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

echo -e '!\n address-family ipv6' | tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 2607:7c80:55:128::" $1 " activate"}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 2607:7c80:55:128::" $1 " maximum-prefix " $5 * 2 + 1}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

tail -n +2 participants.tsv | \
awk -F '\t' '{print " neighbor 2607:7c80:55:128::" $1 " route-server-client"}' | \
tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

echo -e ' exit-address-family\n!\nline vty\n!' | tee -a conf/RS1.bgpd.conf >> conf/RS2.bgpd.conf

