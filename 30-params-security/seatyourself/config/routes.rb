Rails.application.routes.draw do
  get 'home/show'
  root 'home#show'

  resource :users, only: %i(new create edit update)
  resource :sessions, only: %i(new create destroy)

  resources :restaurants, only: %i(index show)
  post 'restaurants/search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
