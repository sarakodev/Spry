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
  resources :bookings, only: [:show]
  resources :bookings do
    member do
      patch :accept
      patch :reject
    end
  end

  # Challenges
  resources :challenges, only: %i[show new create]
  resources :participations, only: [:update]

  # Defines the challenges page
  get 'challenges', to: 'challenges#challenges'

  # Users
  resources :users, only: %i[show]

  # Chatroom
  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end

  get '/auth/strava/callback/', to: 'strava_auth#callback'
  get '/auth/failure', to: 'strava_auth#failure'
  get '/connect_strava', to: 'strava_auth#connect'
end
