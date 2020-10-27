Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root 'pages#home'
  resources :samples
  get '/tagged', to: 'samples#tagged', as: :tagged
  # get '/users/new', to: 'users#new', as: 'register'
end
