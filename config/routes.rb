Rails.application.routes.draw do
  resources :employers do
    resources :complaints
  end
end
