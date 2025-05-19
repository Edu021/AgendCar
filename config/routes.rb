Rails.application.routes.draw do
  get "/register", to: "register#index"
  get "/service", to: "service#index"
  get "/car",     to: "car#index"
  post "/car",    to: "car#create"
  get "/cars/:id/edit", to: "car#edit", as: :edit_car
  patch "/cars/:id",    to: "car#update", as: :car_update
  patch "/profile", to: "profiles#update"
  get 'login/index'

  namespace :api do
    resources :appointments, only: [:index, :create, :show] do
      collection do
        get 'upcominregisterg', to: 'appointments#upcoming'
      end
    end
    resources :carros, only: [:index, :show, :create]
    resources :clients, only: [:create, :index]
    post '/login', to: 'sessions#create'
    post 'register', to: 'clients#create'
  end

  get "/login", to: "login#index"
end
