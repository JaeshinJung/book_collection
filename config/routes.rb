Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  
  

  resources :users
  root "user_books#index"
  resources :user_books
  resources :books do
    member do
      get :delete
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
