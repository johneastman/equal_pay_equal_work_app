Rails.application.routes.draw do
  resources :users
  resources :employers do
    resources :complaints
  end

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
end
