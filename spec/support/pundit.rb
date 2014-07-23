require 'pundit/rspec'

RSpec.configure do |config|
  config.include(Pundit::RSpec::PolicyExampleGroup, {
    :type => :policy,
    :file_path => /spec\/.*\/policies/,
  })
end