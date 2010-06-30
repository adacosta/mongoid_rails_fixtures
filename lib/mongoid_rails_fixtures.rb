# encoding: utf-8

module MongoidRailsFixtures
  def self.dirname; File.dirname(__FILE__); end
end

puts "MongoidRailsFixtures.dirname = #{MongoidRailsFixtures.dirname}"

require 'rubygems'
# Set up gems listed in the Gemfile.
if File.exist?("#{MongoidRailsFixtures.dirname}/../../Gemfile")
  require 'bundler'
  Bundler.setup
end

Bundler.require(:default) if defined?(Bundler)

# action_controller is bundled inside rails, we can't gem require
require 'action_controller'

# Add base to path incase not included as a gem
$:.unshift(MongoidRailsFixtures.dirname) unless
  $:.include?(MongoidRailsFixtures.dirname) || $:.include?(File.expand_path(MongoidRailsFixtures.dirname))

%w[ timestamps_ext railtie_ext fixtures test_help mongoid_ext ].each do |file| 
  require "#{MongoidRailsFixtures.dirname}/mongoid_rails_fixtures/mongoid_ext/#{file}"
end