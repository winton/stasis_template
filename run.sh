#!/bin/bash

if [ $1 = 'dev' ]; then
	cd stasis
	bundle exec stasis -p ../public -d 3000
fi

if [ $1 = 'install' ]; then
	cd stasis
	bundle install
fi

if [ $1 = 'prod' ]; then
	cd stasis
	bundle exec stasis -p ../public
fi

if [ $1 = 'bootstrap' ]; then
	pwd=`pwd`
	cd $2

	rm -rf bootstrap
	rm -rf $pwd/stasis/img/lib/bootstrap
	rm -rf $pwd/stasis/js/lib/bootstrap
	
	mkdir -p $pwd/stasis/img/lib/bootstrap
	mkdir -p $pwd/stasis/js/lib/bootstrap
	
	make bootstrap
	
	cp -f bootstrap/css/bootstrap.css $pwd/stasis/css/lib
	cp -f bootstrap/css/bootstrap-responsive.css $pwd/stasis/css/lib
	cp -f js/*.js $pwd/stasis/js/lib/bootstrap
	cp -f img/*.png $pwd/stasis/img/lib/bootstrap
fi