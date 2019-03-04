---
layout: page
title: Services
permalink: /services/
---

As a member of FCIX, participants get direct access to services provided by other members of the Cabal.

## Route Servers

FCIX operates two route servers on .253 and .254 to aid in ramping new members into the FCIX BGP community quickly.
Addressing and ASN information for the route servers are listed on the [participants](/participants/) page.
These route servers enforce IRR-based route filtering, as well as [several communities to suppress or prepend routes](/rs-policy.html) to other peers using the route servers.

## Google Global Cache

A Google Global Cache node is hosted by PhirePhly Design, AS7034, for the benefit of FCIX participants.
GGC nodes cache popular Google content, including YouTube, etc, to be served locally.
All routes advertised to the FCIX route servers, or AS7034 directly, will be served by this GGC node, with the following exceptions:
* Any routes tagged with the community `7034:8000` to exclude them from being advertised to the GGC node.
* Any routes tagged with the `no-export` community (`65281:7034` will add this community specifically towards AS7034)
* Any routes from AS6939, because they're huge.

## DNS Servers

Notable DNS servers on the exchange include:

* J Root
* B gTLD (.com and .net)

## NTP Servers

The following NTP servers are directly connected to FCIX:

```
server amorite.invalid.network iburst
server time.nullroutenetworks.com iburst
server clock.fmt.he.net iburst
server clepsydra.kjsl.com iburst
server ntp1.thelifeofkenneth.com iburst
```

