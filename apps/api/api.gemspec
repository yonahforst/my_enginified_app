$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "api"
  s.version     = Api::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Api."
  s.description = "TODO: Description of Api."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency 'versionist', '~> 1.2.1'
  s.add_dependency 'jbuilder', '~> 2.1.3'
  s.add_dependency 'jbuilder_cache_multi', '~> 0.0.2'
  s.add_dependency 'kaminari', '~> 0.16.1'
  s.add_dependency 'yajl-ruby', '~> 1.2.0'
  s.add_dependency 'scope_cache_key'  

  s.add_development_dependency "sqlite3"
end
