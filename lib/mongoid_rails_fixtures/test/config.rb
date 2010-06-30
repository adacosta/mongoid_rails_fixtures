# we have to beat the main lib to the bundle load in order to have Rails present for testing
require 'rubygems'
# Set up gems listed in the Gemfile.
if File.exist?( File.dirname(__FILE__) + "/../../../Gemfile")
  require 'bundler'
  Bundler.setup
end

Bundler.require(:default) if defined?(Bundler)

require 'test/unit'

require File.dirname(__FILE__) + '/../../mongoid_rails_fixtures'

Mongoid.configure do |config|
  name = "mongoid_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

# require all models
Dir[File.dirname(__FILE__) + "/models/*.rb"].each {|file| require file }

ENV['FIXTURES_DIR'] = File.dirname(__FILE__) + '/fixtures'