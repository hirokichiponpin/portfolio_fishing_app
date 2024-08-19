Rails.application.routes.draw do
  get 'users/show'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :users, only: [:show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :replies, only: [:create, :destroy]
  end
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  root 'welcome#index'
end

