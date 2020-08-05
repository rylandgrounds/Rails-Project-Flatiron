Rails.application.routes.draw do
  resources :categories
  resources :reviews
  resources :books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#welcome'
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete 'logout' => "sessions#logout"
  get '/signup' => "users#new"
  post '/signup' => "users#create"
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :reviews
  resources :books do
    resources :reviews, only:[:new, :create, :index]
  resources :users
end
