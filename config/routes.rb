Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:show, :new, :create, :delete] do
    resources :bookmarks, only: [:create]
  end
  
  resources :bookmarks, only: [:destroy]

  resources :movies, only: [:show, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end