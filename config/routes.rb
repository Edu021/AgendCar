Rails.application.routes.draw do
  get "/register", to: "register#index"
  get "/service", to: "service#index"
  get "/car",     to: "car#index"  
  get 'login/index'

  namespace :api do
    resources :appointments, only: [:index, :create, :show] do
      collection do
        get 'upcoming', to: 'appointments#upcoming'
      end
    end
    resources :carros, only: [:index, :show, :create]
    resources :clients, only: [:create, :index]
    post '/login', to: 'sessions#create'
    post 'register', to: 'clients#create'
  end

  get "/login", to: "login#index"
end
