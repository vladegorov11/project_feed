Rails.application.routes.draw do

  namespace :admin do
   get '', to: 'dashboard#index', as: '/'
   resources :categories
   resources :sources
   resources :feeds, except: [:show, :index] 
  end

  devise_for :users
  root 'feeds#index'
  resources :users do
    member do
      get 'profile'
      get 'profile_setup'
    end
  end
  namespace 'api' do
    namespace 'v1' do
      resources :events
      resources :feeds
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :feeds, only: [:show, :index] do
      resources :comments
      collection do
        get 'my_feed'
        get 'search'
      end
      member do
        get 'favorite'
      end
  end
  resources :events
end
