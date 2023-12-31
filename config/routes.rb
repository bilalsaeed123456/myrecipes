Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  #get '/recipes', to: 'recipes#index'
  #get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  #get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  #post '/recipes', to:'recipes#create'
  resources :recipes
  #this is to create route with route id and comments in /15/comments form
  resources :recipe do
    resources :comments, only: [:create]
  end
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #devise_for :users, controllers: { sessions: 'sessions' }
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :ingredients, except: [:destroy]
end
