namespace :test do
  task :prepare do
    if Mongoid.configure.migrate_before_tests
      puts "Migrating db"
      Rake::Task['db:migrate'].invoke
    end
  end
end