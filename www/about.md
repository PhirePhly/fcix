---
layout: page
title: About
permalink: /about/
---

The FCIX is a best-effort Internet Exchange originally set up to reduce the number of needed cross-connects between a group of friends in the Hurricane Electric FMT2 colo facility.

First and foremost, FCIX was set up as a learning exercise in running an IX, so if you're a commercial network looking to reduce your transit cost, you should probably join [SFMIX](https://sfmix.org/). We all would too, except few of our networks are large enough to justify the port fees for SFMIX (which are still a good deal). If you're a small network who can't afford MRC on your IX connections, then we're probably the IX for you! [Hit us up](/connect/)!

[Blog post on founding the FCIX](http://blog.thelifeofkenneth.com/2018/04/creating-internet-exchange-for-even.html).

## Architecture

The entire FCIX fabric is built as a VLAN on a single Cisco 6506. I know; very sophisticated.

![FCIX Topology]({{ "/assets/FCIX.png" | absolute_url }})

The two route servers are both VMs spread across two hypervisors inside PhirePhly Design and Mojo Networks, respectively. They're currently running Quagga and BIRD, but that's subject to change as we continue to figure out which route server daemons we prefer.
