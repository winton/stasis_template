#StasisTemplate

[Stasis](http://stasis.me) project template.

Use this project to develop a static web site and deploy it to S3.

#The Stack

Development:

* [Stasis](http://stasis.me)
* [Haml](http://haml-lang.com/), [Sass](http://sass-lang.com), [CoffeeScript](http://coffeescript.org), and [many other languages](http://stasis.me/#more)
* [SmartAsset](http://winton.github.com/smart_asset)

Deploy:

* [AWS::S3](http://amazon.rubyforge.org)

##Install these

* [RubyGems](http://rubygems.org)
* [Bundler](http://gembundler.com)
* [NPM](http://npmjs.org)
* [CoffeeScript](http://coffeescript.org)

##Start a new project

	git clone git@github.com:winton/stasis_template.git
	cd stasis_template
	rake install

##Start developing

	rake dev

## Configure AWS

	cp config/aws.example.yml config/aws.yml
	$EDITOR config/aws.yml

## Deploy (upload to S3)

	rake deploy

## Stay up to date

[Watch this project](https://github.com/winton/booklet#) on Github.

[Follow Winton Welsh](http://twitter.com/intent/user?screen_name=wintonius) on Twitter.