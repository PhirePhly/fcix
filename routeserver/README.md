Steps to set up route servers:

# Configure two interfaces

One on OOB with full Internet access and second on IXP subnet

```
network:
  version: 2
  renderer: networkd
  ethernets:
    ens160:
      addresses: [ 10.x.x.21/24 ]
      gateway4: 10.x.x.1
      nameservers:
              addresses: 
                - "10.x.x.1"
    ens192:
      addresses: [ "206.80.238.253/24", "2001:504:91::253/64" ]
```


# Install required packages

```
sudo apt install python3-dev bgpq3 python-pip python-virtualenv bird
```

# Set up environment and install arouteserver

```
mkdir -p ~/.virtualenvs/arouteserver
virtualenv ~/.virtualenvs/arouteserver
source ~/.virtualenvs/arouteserver/bin/activate
pip install arouteserver
deactivate

mkdir ~/src
cd ~/src
git clone https://github.com/PhirePhly/fcix.git

sudo touch /var/log/bird.log
sudo chown bird:bird /var/log/bird.log
```

# Configure Route Server and Install

```
cd ~/src/fcix
sudo make conf-rsX
```


gateway cron job
```
4 */6 * * *    /home/kenneth/src/fcix/bin/deploy_bird.sh >/dev/null 2>&1
```

route server chron job
```
31 */6 * * *    /home/kenneth/src/fcix/bin/reload_bird.sh >/dev/null 2>&1
58 */6 * * *    /home/kenneth/src/fcix/bin/reload_bird.sh >/dev/null 2>&1
```
