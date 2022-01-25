Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  resources :lists, only: [:show, :new, :create, :delete] do
    resources :bookmarks, only: [:create]
  end
  
  resources :bookmarks, only: [:destroy, :show] do
  end
  resources :movies, only: [:index, :new, :create]

  get 'movies/suggest', to: "movies#suggestion", as: "search"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end