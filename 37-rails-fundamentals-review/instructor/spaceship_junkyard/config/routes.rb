Rails.application.routes.draw do
  root to: 'spaceships#index'
  resources :spaceships
end
