Dgc::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  
  match '/yallo', :to => "home#success", :as => :success

  devise_for :users
  resources :users

  resources :peons
end