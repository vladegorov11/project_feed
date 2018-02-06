require 'sidekiq/web'
Rails.application.routes.draw do

  match '/auth/twitter/callback', to: 'sessions#create', via: 'get'
  match '/auth/failure', to: redirect('/'), via: 'get'
  namespace :admin do
   mount Sidekiq::Web => '/sidekiq'
   get '', to: 'dashboard#index', as: '/'
   get 'all_user', to: 'dashboard#all_user'
   get 'create_content_for_user/:id', to: 'dashboard#create_content_for_user', as: 'create_content_for_user'
   resources :categories
   resources :sources
   resources :feeds, except: [:show, :index]
  end

  namespace 'api' do
    namespace 'v1' do
      resources :events
      resources :feeds
      get 'search', to: 'feeds#search'
      resources :categories
    end
  end

  devise_for :users
  root 'feeds#index'
  resources :users,  only: [:update] do
    member do
      get 'profile'
      get 'profile_setup'
      #get '/auth/twitter/callback', to: 'users#callback'
    end
  end
  get 'search', to: 'feeds#search', as: 'search'
  resources :feeds  do
      resources :comments
      collection do
        get 'my_feeds'
      end
      member do
        get 'favorite'
      end
  end
  resources :events
  resources :categories, only: [:show]
end
