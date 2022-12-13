Rails.application.routes.draw do
  root 'welcome#index'

  get 'rooms/:number', to: 'rooms#show', as: :room
end
