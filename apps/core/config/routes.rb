Core::Engine.routes.draw do
  devise_for :users, 
    path: :user, 
    class_name: "Core::User", 
    module: :devise, 
    controllers: {registrations: 'core/registrations'}
    
  devise_scope :user do
     get 'user', :to => 'registrations#show'
   end
      
end
