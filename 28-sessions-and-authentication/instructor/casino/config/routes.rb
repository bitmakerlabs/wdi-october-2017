Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource  :users, only: %i(create new)
  resources :games, only: :index

  root 'games#index'

end
