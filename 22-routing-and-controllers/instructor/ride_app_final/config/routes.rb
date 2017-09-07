Rails.application.routes.draw do
  root                     to: 'rides#index'
  resources :rides

  # get    'rides',          to: 'rides#index'
  # get    'rides/new',      to: 'rides#new'
  # post   'rides',          to: 'rides#create'
  # get    'rides/:id/edit', to: 'rides#edit'
  # patch  'rides',          to: 'rides#update'
  # get    'rides/:id',      to: 'rides#show'
  # delete 'ride',           to: 'rides#destroy'

  # get    'about',          to: 'rides#about'
  # get    'lorem',          to: 'rides#lorem_ride'
end
