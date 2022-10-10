Rails.application.routes.draw do
  root to: 'pages#top'
  get 'pages/top'
  get "pages/profile", to: "pages#profile"

  resources :rooms, only: [:index, :new, :create]
  get 'rooms/search'

  resources :reservations, only: [:index, :create, :destroy]
  get 'reservations/new', to: "reservations#new"
  get 'reservations/confirm', to: "reservations#confirm"

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
