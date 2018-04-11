.PHONY : www www-install www-dev

www:
	bin/gen_www_participants.sh
	cd www; jekyll build

www-dev: www
	cd www; jekyll serve --livereload

www-install: www
	rsync -av --delete-delay www/_site/ kwfwebsrvr:~/www/fcix.net
