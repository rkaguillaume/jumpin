Rails.application.routes.draw do
  devise_for :users

  get '/service-worker.js' => "service#service_worker"
  get '/manifest.json' => "service#manifest"

  root to: 'lines#index'
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
