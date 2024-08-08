Rails.application.routes.draw do
  get 'users/show'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :users, only: [:show]
  resources :posts, only: [:index, :new, :create]
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  root 'welcome#index'
end

