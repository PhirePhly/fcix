.PHONY : www www-install www-dev conf conf-install-rs1

www:
	bin/gen_www_participants.sh
	bin/gen_routeserver_clients.sh
	bin/gen_routeserver_policypage.sh
	cd www; jekyll build

www-dev: www
	cd www; jekyll serve --livereload

www-install: www
	cd www; JEKYLL_ENV=production jekyll build
	rsync -av --delete-delay --exclude 'traffic.png' www/_site/ fcixhttp.fcix.net:~/fcix.net

conf:
	bin/gen_routeserver_clients.sh
	bin/gen_routeserver_conf.sh

conf-rs1: conf
	cp routeserver/RS1.bird.conf /etc/bird/bird.conf
	cp routeserver/RS1.bird6.conf /etc/bird/bird6.conf
	killall -SIGHUP bird
	killall -SIGHUP bird6

conf-rs2: conf
	cp routeserver/RS2.bird.conf /etc/bird/bird.conf
	cp routeserver/RS2.bird6.conf /etc/bird/bird6.conf
	killall -SIGHUP bird
	killall -SIGHUP bird6



