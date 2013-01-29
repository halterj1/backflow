Backflow::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  devise_for :users,
               :controllers => {
                                 :sessions => 'devise/sessions'},
               :skip => [:sessions] do
      get '/signin'   => "devise/sessions#new",       :as => :new_user_session
      post '/signin'  => 'devise/sessions#create',    :as => :user_session
      get '/signout'  => 'devise/sessions#destroy',   :as => :destroy_user_session
      get "/signup"   => "devise/registrations#new",  :as => :new_user_registration
      get "/profile"  => "devise/registrations#edit", :as => :edit_user_registration
    end
  
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