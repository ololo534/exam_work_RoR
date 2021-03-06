Rails.application.routes.draw do
  get '/main' => 'main#new'
  get 'contact' => 'main#contact'
  root 'main#new'

  get 'search/ajax'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'user#new'
  post '/user' => 'user#create'


  resources :search
  resources :all_recipe
end
