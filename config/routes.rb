Rails.application.routes.draw do
  resources :users
  resources :employers do
    resources :complaints
  end
end
