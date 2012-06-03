require "rubygems"
require "bundler/setup"

Bundler.require(:default)
SmartAsset.load_config(File.expand_path('../', @_stasis.root))

ignore /\/_.*/, /\/config/, /\/css\/lib\/bootstrap\//, /Gemfile/

layout 'layout.html.haml'

helpers do
  def content_for(key, &block)
    @content ||= {}
    @content[key] = capture_haml(&block) if block_given?
    @content && @content[key]
  end
end

class Tilt::HamlTemplate
  def prepare
    options = @options.merge(:filename => eval_file, :line => line)
    # Custom options
    options = options.merge :ugly => true
    @engine = ::Haml::Engine.new(data, options)
  end
end