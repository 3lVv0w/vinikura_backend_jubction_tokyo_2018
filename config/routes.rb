Rails.application.routes.draw do
  mount API::Base, at: "/"
  resources :products
end
