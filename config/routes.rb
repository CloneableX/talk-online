Rails.application.routes.draw do
  root 'welcome#index'

  resources :rooms, only: [:create] do
    get 'number', to: 'room_numbers#show', as: :number
  end
  get 'rooms/:number', to: 'rooms#show', as: :room
end
