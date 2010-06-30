# encoding: utf-8

if defined?(Rails::Railtie)
  module Rails #:nodoc:
    module Mongoid #:nodoc:
      class Railtie < Rails::Railtie

        rake_tasks do
          load "mongoid_rails_fixtures/tasks/database.rake"
          load "mongoid_rails_fixtures/tasks/test.rake"
        end
      end
    end
  end
end