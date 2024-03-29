Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/new'
  get 'bookmarks/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # resources :lists
  # resources :movies
  # resources :bookmarks

  resources :lists do
    resources :bookmarks, only: %i[index new create]
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
