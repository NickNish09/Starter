Rails.application.routes.draw do
  namespace :admin do
    resources :contacts
    resources :services
    resources :users
  end
  resources :admin, only: [:index]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'main#index'

  namespace :v1, defaults: { format: :json } do
    post "token_login" => "sessions#token_login"
    post "login" => "sessions#create"
    post "cadastro" => "registrations#create"
    post "google_oauth2" => "sessions#google_oauth2"
    post "upload_avatar" => "users#upload_avatar"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
