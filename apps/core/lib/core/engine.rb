require 'devise'
require 'sass-rails'
require 'bootstrap-sass'
require 'autoprefixer-rails'
require 'postmark-rails'
require 'simple_form'
require 'pundit'
require 'simple_token_authentication'

module Core
  class Engine < ::Rails::Engine
    isolate_namespace Core

    initializer :devise_respond_to_json do |app|
      app.config.to_prepare do
         DeviseController.respond_to :html, :json
      end
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    initializer 'asset_precompile_paths' do |app|
      app.config.assets.precompile += ["core/manifests/*"]
    end

  end
end
