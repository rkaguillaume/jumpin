Rails.application.routes.draw do
  devise_for :users

  get '/service-worker.js' => "service#service_worker"
  get '/manifest.json' => "service#manifest"
  get '/account' => "pages#account"

  get 'contact-me', to: 'messages#new', as: 'new_message'
  post 'contact-me', to: 'messages#create', as: 'create_message'

  authenticated do
    root :to => 'favorites#index', as: :authenticated
  end

  root to: 'lines#index'
  resources :favorites, only: [:index]
  resources :lines, only: [:index, :show]
  resources :stops, only: [:show], shallow: true do
    resources :favorites, only: [:create, :destroy]
    scope module: :stops do
      collection do
        resource :near, only: [:show]
      end
    end
  end

  resources :searches, only: [:index]


  resources :maps, only: [:index]


  resources :reviews, only: [:new, :create, :index]

end
