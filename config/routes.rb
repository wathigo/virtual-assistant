Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: %i[create destroy show index]
  resources :services, only: %i[create destroy show index]
  root 'categories#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
