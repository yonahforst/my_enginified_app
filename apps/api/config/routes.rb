Api::Engine.routes.draw do
  
  api_version(:module => "V1", :path => {:value => "v1"}, :default => true) do

    # resources :users

    # cancel_user_registration_path  GET  /users/cancel(.:format)  devise/registrations#cancel
    # user_registration_path  POST  /users(.:format)  devise/registrations#create
    # new_user_registration_path  GET  /users/sign_up(.:format)  devise/registrations#new
    # edit_user_registration_path  GET  /users/edit(.:format)  devise/registrations#edit
    # PATCH  /users(.:format)  devise/registrations#update
    # PUT  /users(.:format)  devise/registrations#update
    # DELETE  /users(.:format)  devise/registrations#destroy
    #
    # devise_for :users,
    #   controllers: {sessions: "api/v1/sessions", registrations: 'api/v1/registrations'},
    #   class_name: "Core::User",
    #   module: 'api/v1/users',
    #   only: [:sessions, :registrations]
  end
end
