---
layout: post
title: "The Anatomy of a Peering Request"
categories: whitepaper
---

The key advantage to running an Autonomous System is that you are no longer constrained to only connecting to one upstream network provider, but can "peer" with additional networks to directly exchange traffic, be it either by a dedicated cross connect (or Private Network Interconnect, PNI) or by both joining an Internet Exchange Point like FCIX. 
Every network needs to start by setting up a BGP peering session with their transit provider, since you do need to ultimately get ALL of the routes from somewhere, but all of the additional BGP peering sessions established beyond that first one are tactical decisions which are motivated by your network's business objectives.

Where transit ports are a paid relationship, BGP peering across IXPs and PNIs tends to be viewed much more as an equitable arrangement benefiting both parties, since it's providing a short cut for traffic which both networks previously needed to send across their transit ports.
This means that peering can be classified as the free zero settlement relationship between the two networks (with plenty of exceptions on the $0 part in the real world), and is the purpose built function of Internet Exchange Points to facilitate and make easier. IXPs make peering easier in a few ways:

1. IXPs provide direct L2 connectivity between all the peers while only consuming a single port on each network's router. Ethernet ports on routers can be relatively expensive, so being able to use a single port for dozens of peers spreads out that cost between peers which might not be big enough to individually justify the expense of a dedicated router port.

2. IXPs allow networks to avoid the need to order a physical cross connect between the two networks before peering can be established. Cross connects in data centers can often be expensive, and if the networks aren't in the same building can be VERY expensive, but IXPs again allow the cost of cross connects and metro transport to be amortized across lots of peers.

3. IXPs provide a directory of available peers with a unique global IP address assigned to each member. This avoids the issue of the two networks needing to coordinate which network provides the /31 for the point-to-point between the two networks, and keeping track of that information long term. 

So Internet Exchange Points make peering much easier, but it still doesn't happen automatically.
To assist in this, most IXPs provide one or two "route servers", which are BGP peers which sit on the IXP fabric, but don't actually expect you to send them any traffic.
The route servers will establish a peering session with every (or most) peers on the IXP, collect all of the routes received into a single BGP table, and redistribute this table to every other peer on the IXP along with information about which peer originally provided the route.
As of early 2021, the FCIX route servers provide peers with 85k IPv4 routes and 35k IPv6 routes, so peering with the route servers can immediately provide a large fraction of the benefit of the IXP to new members automatically.
For some networks, this may be good enough and the end of configuring BGP peering on their routers, but it's often a good idea to configure additional direct peering sessions with other networks by-passing the IXP route servers. 

This means if there's two hosts on the network, instead of only receiving each other's routes via the route server BGP sessions, they configure a session directly between their IXP peering addresses.
This has a couple advantages:

1. You are no longer relying on the IXP route servers for these prefixes. If there's a planned or unplanned outage of the IXP route servers, but the underlying L2 fabric is still up, networks with direct peering sessions can still exchange traffic independent of the route servers.

2. Some networks won't participate on the IXP's route servers at all, so the only way to reach them across the IXP is to peer directly. This is because some networks prefer to maintain more fine grained control over their peering instead of just tossing their prefixes into the route server cement mixer to be blindly sprayed across the rest of their peers.

3. Many networks will only advertise a subset of their routes to the route servers, but provide all of their routes once you establish a direct peering session.

# When to Send a Peering Request

The simplest answer for when to send a peering request is... once you turn up your IXP port.
To send a peering request sooner than this may not be very effective, since your two networks aren't actually connected yet, but even once you connect to an IXP, blindly sending a peering request to every network on the IXP may not yield very positive results or feedback.

The issue is that while peering across an Internet Exchange is much cheaper and easier than establishing a direct cross connect, there's still the expense and overhead of managing the configuration and state of one more BGP session on one more router in however big the other party's network is. 
So while cheap, peering sessions aren't free, so some care should still be used when selecting peers. Some possible reasons you should use to justify sending a peering request may be:

* "I see in my network analytics that we're sending quite a bit of traffic to your network over our transit port, and would like to directly exchange that traffic across our mutual IXP"

* "I think some routes in your network would be of high value to me" i.e. root DNS servers, VoIP providers, anything latency sensitive regardless of volume.

* "We met over beers at NANOG and had a grand old time! I want to peer because we're friends." BGP peering often happens just because of personal relationships between people inside both networks. You don't always need to use a quantitative or qualitative metric to justify the exchange.

# What Needs to be in a Peering Request

It's important to remember that the other network quite possibly has no idea who you are, so it's important to build context in your initial email about why you're emailing them and which exchange point the two of you have in common. 
Some networks are on dozens or hundreds of IXPs, so make sure you let them know which one or multiple exchange points you're talking about, because they won't appreciate needing to go try and figure it out on their own.

You really want to make peering for the other party super easy.
The more useful information you can include in the peering email, without making them read a rambling email about how much you like networking and Ethernet, the more likely it is that they will agree that you're worth the bother.
This means that in addition to a short introduction and some justification for the direct peering session, it can also be handy to provide them all of the A side and Z side numbers they would need to go look up otherwise to configure the session.
This can also be a good sanity check to make sure both sides agree on where this BGP peering session is being set up and that you're talking to the right people about the autonomous system you're interested in!

A typical peering request may look something like the following:

```
From: noc@example.net
To: noc@he.net
Subject: Direct Peering Request across FCIX

Howdy Hurricane Electric!

I was interested in establishing a direct peering session across FCIX
in Fremont, California, USA.

I expect to be sending you quite a bit of traffic at that location, and
hear that you only advertise part of your customer cone to the IXP 
route servers, where we'd like to get your full customer cone!

Our side of the session:
AS64501
IPv4: 206.80.238.251
IPv6: 2001:504:91::251

Your side of the session:
AS6939
IPv4: 206.80.238.9
IPv6: 2001:504:91::9

Let me know if you're interested!

With much love and many bits,
Joe Smith
Example Network Engineer
```

Short. Clear. Has all the information the other network needs to configure and deploy their side of the session before even emailing you back!

A typical successful exchange at this point would be the other NOC emailing you back going "yeah, we're interested. We've configured the session and are ready to go on our side"
You could then configure your end, make sure it comes up and you send them the intended routes and receive the intended routes, and email them back "Everything is up and looks good on my side, thanks!"

Odds are also good that you'll get absolutely no response at all. A professional hazard of asking others to do free work for you, even if it might benefit them as well.

# Configuring BGP Neighbors Before the Peering Request

Some networks will configure the BGP peering session with the network they want to peer with before sending them the peering request email. 
This is generally frowned upon, because this BGP peering session hasn't been configured or even agreed to by the other side yet, so an attempted BGP connection to their router will show up in their logs as a denied BGP connection attempt.

A better way to pre-stage your router configuration for a smooth turn-up is to configure the peer, but with "passive" transport enabled on your end.
This is a common BGP option where your router will listen for and accept the BGP peering session, but won't actively try and connect with the other peer. 
The exact syntax will vary per vendor, but using Arista EOS as an example, your configuration may look like the following:

```
neighbor 206.80.238.9 peer group FCIX-PEER
neighbor 206.80.238.9 remote-as 6939
neighbor 206.80.238.9 passive
neighbor 206.80.238.9 description HE - FCIX
neighbor 2001:504:91::9 peer group FCIX-PEER
neighbor 2001:504:91::9 remote-as 6939
neighbor 2001:504:91::9 passive
neighbor 2001:504:91::9 description HE - FCIX
```

This way, your router won't be trying to connect and establish a BGP connection with the counterparty before they agree, but when they receive your peering request and go to configure the session, they will immediately be able to see the peering session come up once they configure it.

If everything goes well, the whole exchange can be done in a single back and forth. 

* "Can we peer directly?"
* "Yeah! I've configured it and already see it up. Looks good on my end!"
* "Thanks! It looks good on my side as well."
