require File.dirname(__FILE__) + '/config'

module Mongoid
  class TestCase < ActiveSupport::TestCase #:nodoc:

    def setup
      drop_collections
    end

    def teardown; end

    def test_fixture_invoke
      # mock Rake::Task['db:fixtures:load'].invoke
      load_test_fixtures(['users'])
      bob = User.where(:username => 'bob').first
      assert (User.all.size > 0), "Users should have loaded"
      assert bob.respond_to?(:username), "Bob should have a username"
    end

    private

    def load_test_fixtures(fixture_names, &block)
      fixtures_dir = ENV['FIXTURES_DIR']
      fixture_names.each {|fixture_name| fixture_name.gsub!('.rb', '') }
      find_files(fixtures_dir, "{#{fixture_names * ','}}.{yml,csv}").map do |file|
        Fixtures.create_fixtures(File.dirname(file), File.basename(file, '.*'))
      end
    end

    def find_files(base_dir, file_pattern, &block)
      files = []
      Dir.glob(File.join(base_dir, file_pattern)).each do |file|
        yield file if block_given?
        files << file
      end
      files
    end

    def drop_collections
      (Mongoid.master.collections.reject { |c| c.name == 'system.indexes' }).map(&:drop)
    end

  end
end