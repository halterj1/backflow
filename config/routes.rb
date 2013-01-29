Backflow::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  #map.resources :users, :has_many => :reports
  
  devise_for :users
  
  resources :users do
    resources :comments
  end
  
  resources :reports do
    resources :comments
  end
  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
end