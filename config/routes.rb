Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "lists#index"
  # get "/lists", to: "lists#index"
  # post "/lists", to: "lists#create"
  # get "/lists", to: "lists#new"
  # get "/lists/:id/edit", to: "lists#edit"
  # get "/lists/:id", to: "lists#show"
  # patch "/lists/:id", to: "lists#update"
  # delete "/lists/:id", to: "lists#destroy"

  resources :lists do
    resources :bookmarks, only: [:index, :new, :create]
  end
  resources :bookmarks, only: [:show, :edit, :update, :destroy]
  resources :movies

end
