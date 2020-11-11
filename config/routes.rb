Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root 'pages#home'
  resources :samples
  get '/tagged', to: 'samples#tagged', as: :tagged
  get '/tags', to: 'samples#tags_index'
  resources :categories
  get '/categorised_samples', to: 'categories#categorise_samples'
  resources :libraries
end
