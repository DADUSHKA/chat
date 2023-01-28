Rails.application.routes.draw do
  root "rooms#index"

  resources :rooms, only: %i[show create], param: :title
  resources :messages, only: :create

  resource :registrations, only: %i[new create]

  resource :sessions, only: %i[new create]

  get 'sessions', to: 'sessions#destroy'
end
