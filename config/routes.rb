Rails.application.routes.draw do

  devise_for :users

  resources :users do
    member do
      get 'profile'
      get 'profile_setup'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'feeds#index'
  resources :feeds do
      resources :comments
      collection do
        get 'search'
        get 'update_news'
      end
      member do
        get 'favorite'
      end
  end
  resources :sources
  resources :events 
end
