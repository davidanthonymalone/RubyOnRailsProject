  Rails.application.routes.draw do

  resources :games
      root 'games#index'
         
       get  '/home',    to: 'games#index'
      get  '/add',    to: 'games#new'
      get  '/about',   to: 'static_pages#about'
      get  '/contact', to: 'static_pages#contact'
      get  '/signup',  to: 'users#new'
      get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      delete '/logout',  to: 'sessions#destroy'
      resources :users
    end