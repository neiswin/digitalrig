require 'sidekiq/web'



Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get 'pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  resources :opcvalues, only: %i[index create]
end
