.PHONY : www www-install www-dev conf conf-install-rs1

www:
	bin/gen_www_participants.sh
	cd www; jekyll build

www-dev: www
	cd www; jekyll serve --livereload

www-install: www
	cd www; JEKYLL_ENV=production jekyll build
	rsync -av --delete-delay www/_site/ kwfwebsrvr:~/www/fcix.net

conf:
	bin/gen_routeserver_bgpd.sh

conf-install-rs1: conf
	cp conf/RS1.zebra.conf /etc/quagga/zebra.conf
	cp conf/RS1.bgpd.conf /etc/quagga/bgpd.conf

conf-install-rs2: conf
	cp conf/RS2.zebra.conf /etc/quagga/zebra.conf
	cp conf/RS2.bgpd.conf /etc/quagga/bgpd.conf

