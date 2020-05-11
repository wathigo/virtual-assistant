Rails.application.routes.draw do
  resources :room_messages
  resources :rooms, only: %i[index show]
  devise_for :users
  resources :categories, only: %i[create destroy show index]
  resources :services, only: %i[create destroy show index]
  resources :service_mappers, only: %i[create destroy show index]
  resources :home, only: %i[index]
  root 'home#index'
  resources :room_messages
  resources :rooms
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
