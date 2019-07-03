Rails.application.routes.draw do
  resources :admin, only: [:index]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
