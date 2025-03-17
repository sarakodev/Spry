Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "pages#home"

  # Defines the second page
  get 'welcome', to: 'pages#welcome'

  # root "posts#index"
  resources :events do
    resources :bookings, only: %i[create]
  end

  # Bookings
  resources :bookings do
    resources :bookings, only: :index
    member do
      patch :accept
      patch :reject
    end
  end

  # Challenges
  resources :challenges, only: %i[show]

  # Defines the challenges page
  get 'challenges', to: 'challenges#challenges'

  # Users
  resources :users, only: %i[show]
end
