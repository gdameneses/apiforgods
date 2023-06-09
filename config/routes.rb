Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "languages#index"
  resources :languages, only: [:show, :create, :destroy]
  resources :bookmarks, only: [:index, :create, :destroy]
  resources :repos, only: [:show]
end
