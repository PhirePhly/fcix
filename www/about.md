---
layout: page
title: About
permalink: /about/
---

The FCIX is a best-effort Internet Exchange originally set up to reduce the number of needed cross-connects between a group of friends in the Hurricane Electric FMT2 colo facility.

First and foremost, FCIX was set up as a learning exercise in running an IX, so if you're a commercial network looking to reduce your transit cost, you should probably join [SFMIX](https://sfmix.org/). We all would too, except few of our networks are large enough to justify the port fees for SFMIX (which are still a good deal). 

## Architecture

The entire FCIX fabric is built as a VLAN on a single Cisco 6506. I know; very sophisticated.

The two route servers are both VMs spread across two hypervisors inside PhirePhly Design and Mojo Networks, respectively. They're currently running Quagga and BIRD, but that's subject to change as we continue to figure out which route server implementation is the least buggy.
