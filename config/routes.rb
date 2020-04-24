Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: %i[create destroy show index]
  resources :services, only: %i[create destroy show index]
  resources :service_mappers, only: %i[create destroy show index]
  resources :home, only: %i[index]
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
