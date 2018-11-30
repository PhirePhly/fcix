---
layout: page
title: Services
permalink: /services/
---

As a member of FCIX, participants get direct access to services provided by other members of the Cabal.

## Route Servers

FCIX operates two route servers on .253 and .254 to aid in ramping new members into the FCIX BGP community quickly. These route servers enforce IRR-based route filtering, as well as [several communities to suppress or prepend routes](https://en.wikipedia.org/wiki/Internet_exchange_point) to other peers using the route servers.

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
```

This list was formatted to allow to be directly added to ntp.conf
