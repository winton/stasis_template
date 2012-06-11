require "bundler/setup"
Bundler.require(:default)

ignore /\/_.*/, /\/config/, /\/css\/lib\/bootstrap\//, /Gemfile/
layout 'layout.html.haml'