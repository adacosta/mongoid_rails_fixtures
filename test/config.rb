# we have to beat the main lib to the bundle load in order to have Rails present for testing
require 'rubygems'
# Set up gems listed in the Gemfile.
if File.exist?( File.dirname(__FILE__) + "/../Gemfile")
  require 'bundler'
  Bundler.setup
end

Bundler.require(:default) if defined?(Bundler)

require 'test/unit'

require File.dirname(__FILE__) + '/../lib/mongoid_rails_fixtures'

# require all models
Dir[File.dirname(__FILE__) + "/models/*.rb"].each {|file| require file }

Rake.application.add_import File.dirname(__FILE__) + '/test_helper.rake'
Rake.application.add_import File.dirname(__FILE__) + '/../lib/mongoid_rails_fixtures/tasks/database.rake'
Rake.application.load_imports

module MongoidRailsFixtures
  class TestRailsApp < Rails::Application; end
end
MongoidRailsFixtures::TestRailsApp.initialize!

# connect to our local mongodb
Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("mongoid_test")
end

# borrowed from http://thinkingdigitally.com/archive/capturing-output-from-puts-in-ruby/
require 'stringio'
module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end