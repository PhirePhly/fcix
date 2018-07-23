#!/bin/bash
#
# gen_asset.sh - Generates an IRR as-set of all the members
# Kenneth Finnegan, 2018

# Print the as-set header
cat <<EOF
as-set:     AS33495:AS-MEMBERS
descr:      All as-sets listed on PeeringDB for FCIX participants
EOF

# For each participant in the database
tail -n +2 participants.tsv | \
# Pull out their ASN
awk -F '\t' '{print $3}' | \
# Combine them into one comma separated list
paste -sd "," - | \
# Query PeeringDB for each member's IRR object
xargs -I % curl -s https://www.peeringdb.com/api/net?asn__in=% | \
# Parse the JSON down to the data{irr_as_set}
jq '.data|.[]|.irr_as_set|select (length>0)' | \
# Delete all of the quotation marks around the IRR objects
tr -d '"' | \
# Break multiple IRR objects onto their own lines
tr " " "\n" | \
# Strip the RIPE:: or ARIN:: prefixes that some people put in their IRR names
sed 's/^.*:://' | \
# Prepend the RPSL syntax for as-set members
sed 's/^/members:    /g'

# Print footer of as-set
cat <<EOF
tech-c:     FINNE74-ARIN
mnt-by:     MAINT-AS33495
changed:    noc@fcix.net `date '+%Y%m%d'`
source:     ALTDB
EOF

