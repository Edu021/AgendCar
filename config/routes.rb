Rails.application.routes.draw do
  namespace :api do
    resources :appointments, only: [:index, :create, :show] do
      collection do
        get 'upcoming', to: 'appointments#upcoming'
      end
    end
  end
end
