Rails.application.routes.draw do
  resources :pages
  #   get 'about/index'
  #   get 'home/index'
  #   get 'sales/index'
  #   get 'sales/show'
  #   get 'plataforms/index'
  #   get 'plataforms/show'
  #   get 'publishers/index'
  #   get 'publishers/show'
  #   get 'games/index'
  #   get 'games/show'
  # get "pages/:permalink"
  resources :about, except: [:show]
  root to: "home#index"
  resources :games, only: %i[index show] do
    get "search", on: :collection
  end
  resources :publishers, only: %i[index show]
  resources :plataforms, only: %i[index show]
  resources :sales, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
