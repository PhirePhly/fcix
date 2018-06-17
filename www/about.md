---
layout: page
title: About
permalink: /about/
---

## "The third largest IXP in Hurricane Electric FMT2!"

The FCIX is a best-effort Internet Exchange which was originally set up to reduce the number of needed cross-connects between a group of friends in the Hurricane Electric FMT2 colo facility, but has quickly grown into being an actual IXP.

First and foremost, FCIX was set up as an affordable way for networks to join an IXP. Not every network can justify the non-zero expense of joining larger IXPs like [SFMIX](https://sfmix.org/) (which is still a good deal). If you're a small network who can't afford MRC on your IX connections, then we're the IXP for you! [Hit us up](/connect/)!

[Blog post on founding the FCIX](http://blog.thelifeofkenneth.com/2018/04/creating-internet-exchange-for-even.html).

## Architecture

The entire FCIX fabric is built as a VLAN on a single Cisco 6506. I know; very sophisticated. Arista has been kind enough to donate a pair of 7050S-64 switches, so this will soon be corrected.

![FCIX Topology]({{ "/assets/FCIX.png" | absolute_url }})

## History

* April, 2018 - IXP founded as a VLAN on PhirePhly Design's Cisco 6506
* June, 2018 - Donations from Arista and FlexOptics accepted to soon move FCIX to its own switch.
