Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#welcome'
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete 'logout' => "sessions#logout"
  get '/signup' => "users#new"
  post '/signup' => "users#create"
  get '/users/:id', to: 'users#show', as: 'user'
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :reviews, only: [:edit, :destroy, :update, :show]
  resources :books do
    resources :reviews, only:[:new, :create, :index]
  end
end
