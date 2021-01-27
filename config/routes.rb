Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/home'
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  root 'pages#home'
  resources :samples
  get '/tagged', to: 'samples#tagged', as: :tagged
  get '/tags', to: 'samples#tags_index'
  resources :categories
  get '/categorised', to: 'categories#categorise_samples'
  resources :libraries
end
