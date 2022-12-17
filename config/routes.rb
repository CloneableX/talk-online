Rails.application.routes.draw do
  root 'rooms#new'

  resources :sessions, only: [:create]

  resources :rooms, only: [:new, :create] do
    get 'number', to: 'room_numbers#show', as: :number
  end
  get 'rooms/:number', to: 'rooms#show', as: :room
end
