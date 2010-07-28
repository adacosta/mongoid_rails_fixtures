require File.dirname(__FILE__) + '/config'

module Mongoid
  class TestCase < ActiveSupport::TestCase #:nodoc:

    def setup
      drop_collections
    end

    def teardown; end

    def test_fixture_invoke
      # verify db is empty
      bob = User.where(:username => 'bob').first
      assert_equal 0, User.count, "Users should be empty loaded"

      # load and verify fixture
      Rake::Task['db:fixtures:load'].invoke
      bob = User.where(:username => 'bob').first
      assert (User.count > 0), "Users should have loaded"
      assert bob.respond_to?(:username), "Bob should have a username"
    end

    def test_identify_fixture
      ENV["LABEL"] = 'users'
      output = capture_stdout do
        Rake::Task['db:fixtures:identify'].invoke
      end
      assert_equal 'The fixture ID for "users" is 344172009.', output.string.chomp, "Identity should have ID for users"
    end

    private

    def drop_collections
      (Mongoid.master.collections.reject { |c| c.name == 'system.indexes' }).map(&:drop)
    end

  end
end