Rails.application.routes.draw do
  match '/auth/twitter/callback', to: 'sessions#create', via: 'get'
  match '/auth/failure', to: redirect('/'), via: 'get'
  namespace :admin do
   get '', to: 'dashboard#index', as: '/'
   get 'all_user', to: 'dashboard#all_user'
   get 'create_content_for_user/:id', to: 'dashboard#create_content_for_user', as: 'create_content_for_user'
   resources :categories
   resources :sources
   resources :feeds, except: [:show, :index]
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
  namespace 'api' do
    namespace 'v1' do
      resources :events
      resources :feeds
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :feeds  do
      resources :comments
      collection do
        get 'my_feeds'
        get 'search'
      end
      member do
        get 'favorite'
      end
  end
  resources :events
  resources :categories, only: [:show]
end
