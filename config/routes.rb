Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#welcome'
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete 'logout' => "sessions#logout"
  get '/signup' => "users#new"
  post '/signup' => "users#create"
  get '/auth/:provider/callback', to: 'sessions#create'
end
