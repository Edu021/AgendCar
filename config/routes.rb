Rails.application.routes.draw do
  namespace :api do
    resources :appointments, only: [:index]
  end
end
