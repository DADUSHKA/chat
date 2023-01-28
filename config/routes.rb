Rails.application.routes.draw do
  root "rooms#index"

  resource :registrations, only: %i[new create]

  resource :sessions, only: %i[new create destroy]

  get 'sessions', to: 'sessions#destroy'
end
