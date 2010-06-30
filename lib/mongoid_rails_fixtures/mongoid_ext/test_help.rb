if defined?(Mongoid)
  # TODO: change path after gemify
  require File.dirname(__FILE__) + '/test_case'

  class ActiveSupport::TestCase
    include Mongoid::TestFixtures
    self.fixture_path = "#{Rails.root}/test/fixtures/"
  end

  ActiveSupport::TestCase.send :define_method, :fixture_path do
    "#{Rails.root}/test/fixtures/"
  end

  ActionController::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path

  def create_fixtures(*table_names, &block)
    Fixtures.create_fixtures(ActiveSupport::TestCase.fixture_path, table_names, {}, &block)
  end
end