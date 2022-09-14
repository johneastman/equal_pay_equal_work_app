Rails.application.routes.draw do
  resources :users
  resources :employers do
    resources :complaints

    get "complaints/:id/generate" => "complaints#generate_complaint", as: :generate_complaint
  end

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
end
