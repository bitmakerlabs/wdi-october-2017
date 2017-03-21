Rails.application.routes.draw do
  root 'robots#index'

  get "first" => "pages#first"
  get "second" => "pages#second"

  resources :robots

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
