require "bundler/setup"
Bundler.require(:default)

ignore /\/_.*/            # Filenames beginning with underscore (_)
ignore /\/config/         # Config files
ignore /Gemfile/          # Gemfile, Gemfile.lock
ignore 'README.md'        # README

layout 'layout.html.haml' # Application-wide layout