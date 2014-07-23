require 'core'
require 'versionist'
require 'jbuilder'
require 'jbuilder_cache_multi'
require 'kaminari'
require 'yajl'
require 'scope_cache_key'

module Api
  class Engine < ::Rails::Engine
    isolate_namespace Api
  end
end
