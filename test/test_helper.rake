# stub for rails environment rake task
unless Rake.application.tasks.include? 'db:environment'
  namespace :db do
    desc "stub environment"
    task :environment do
      'test'
    end
  end
end