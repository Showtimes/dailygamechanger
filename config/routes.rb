Dgc::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  
  match '/yallo', :to => "home#success", :as => :success
  match '/junior', :to => "home#resubscribed", :as => :resubscribed
  match '/peons/:id/unsubscribe', :to => "peons#unsubscribe", :as => :unsubscribe_peon
  match '/peons/:id/bai', :to => "peons#unsubscribed", :as => :unsubscribed
  match '/newman', :to => "home#bad_key", :as => :bad_key


  devise_for :users
  resources :users

  resources :peons
  resources :changers
end