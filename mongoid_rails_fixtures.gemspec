Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'mongoid_rails_fixtures'
  s.version     = '0.0.1'
  s.summary     = 'Fixtures for Mongoid in classic rails style.'
  s.description = 'Retain your old testing workflow with Mongodb power'

  # only tested with 1.9.1
  s.required_ruby_version     = '>= 1.8.6'
  s.required_rubygems_version = ">= 1.3.6"

  s.author            = 'Alan Da Costa'
  s.email             = 'alandacosta@gmail.com.com'
  s.date              = %q{2010-06-29}
  s.homepage          = "http://github.com/adacosta/#{s.name}"

  s.require_paths = ["lib"]
  s.files         = Dir['.gitignore', 'Gemfile', 'Rakefile', 'README.rdoc', "#{s.name}.gemspec", 'lib/**/*']
  s.test_files    = Dir['test/**/*']
  s.has_rdoc      = false

	rails_version = '>= 3.0.0.rc'

  s.add_dependency('bundler', '>=0.9.26')
	s.add_dependency('mongoid', '>=2.0.0.beta.7')
  s.add_dependency('rails',  rails_version)
  s.add_dependency('railties',  rails_version)
  s.add_dependency('activesupport',  rails_version)
end