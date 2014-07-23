$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "core"
  s.version     = Core::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Core."
  s.description = "TODO: Description of Core."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency 'devise', "~> 3.2.4"
  s.add_dependency 'sass-rails', '>= 4.0'
  s.add_dependency 'bootstrap-sass', '~> 3.2.0'
  s.add_dependency 'autoprefixer-rails', '~> 2.1.1'
  s.add_dependency 'postmark-rails'
  s.add_dependency "simple_form", "~> 3.0"
  s.add_dependency "pundit", "~> 0.2"
  s.add_dependency 'simple_token_authentication', "~> 1.5"
  s.add_development_dependency "sqlite3"
end
