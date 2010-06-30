# encoding: utf-8

module Mongoid #:nodoc
  class Config #:nodoc
    # current rails behavior is to not migrate before tests
    attr_accessor :migrate_before_tests
    # current rails behavior is to delete existing fixtures before create
    attr_accessor :delete_existing_fixtures_before_create
  end

  Mongoid.configure.delete_existing_fixtures_before_create = true

  # originally in AR/database_statements
  # Inserts the given fixture into the table. Overridden in adapters that require
  # something beyond a simple insert (eg. Oracle).
  def self.insert_fixture(fixture, table_name)
    klass = table_name.singularize.capitalize.constantize
    klass.create fixture.instance_variable_get(:@fixture)
  end
end