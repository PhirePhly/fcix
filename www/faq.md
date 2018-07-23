---
layout: page
title: FAQ
permalink: /FAQ/
---

### Are you really a cabal?

No. We started calling ourselves a cabal in jest, and the name stuck.
We also call ourselves the Oligarchs of Aisle Six, but that's obviously not true either.

### Are you trying to compete with other Internet Exchanges in the Bay Area?

No.
If you're looking to join a local IX with a valuable mix of major members, we strongly encourage you to join [SFMIX](https://sfmix.org/).
We founded FCIX as an IXP option for the smallest of networks still interested in participating in IXP peering.
If you're a network with zero budget for ports on Internet Exchanges, then you're likely a good candidate for the Cabal. 

### Can I join FCIX?

Sure. See the [connect](/connect/) page.

### My network isn't in Hurricane Electric FMT2; can I still join?

No. We generally can't support VPN tunnels into the IXP.
That's just more work for us without any actual routing improvement for the Internet. 
We are planning an expansion into HE FMT1, so please contact us if you're interested in that or any other bay area expansion.

### What's the Monthly Recurring Cost for joining FCIX?

$0/mo for 1x1Gbps, double that for anything faster.

Don't worry; we take our level of service at these prices very seriously, and will always make sure to refund port fees for any outages suffered on the FCIX.

### Do you have anything faster than 1G?

Yes! We just migrated to a pair of Arista 7050-64s, so we've got 10G ports available. It wouldn't really be a cabal without 10G Ethernet, now would it?

### How do you pronounce FCIX?

It isn't polite.

### Do you support BCP214?

Yes! Despite being a cabal, we take blackholing of traffic very seriously, so BGP sessions are forced down and traffic drained before ports are taken offline for service.

### Do the route servers implement filtering?

Yes! Our route servers support IRR filtering and community-based redistribution filtering.
For more information on IRR filtering, see [our whitepaper on a quickstart to IRR](/whitepaper/2018/07/14/intro-to-irr-rpsl.html).
For more information on what communities our route servers support, see [the route server policy page](/rs-policy.html).
