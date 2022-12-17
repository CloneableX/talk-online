Rails.application.routes.draw do
  root 'welcome#index'

  resources :rooms, only: [:create]
  get 'rooms/:number', to: 'rooms#show', as: :room

  get 'room_numbers/:room_id', to: 'room_numbers#show', as: :room_number
end
