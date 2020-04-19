Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets do
    member do
      post 'retweet'
    end
  resources :likes, only: [:create, :destroy]
  end
 

  devise_for :users, controllers: {
    sessions: 'users/sessions'
    
  }
  resources :users, :only => [:show] do
    resources :follows
  end

  #get '/tweets/hashtags/:name', to: "tweets#hashtags" 

  root 'tweets#index'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

