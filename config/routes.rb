Rails.application.routes.draw do

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
  root 'tweets#index'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

