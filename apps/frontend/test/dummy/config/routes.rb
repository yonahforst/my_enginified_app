Rails.application.routes.draw do

  mount Frontend::Engine => "/frontend"
end
