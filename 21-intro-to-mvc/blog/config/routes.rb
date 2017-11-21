Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'posts' => 'posts#index'
  # get 'posts/new' => 'posts#new'
  # get 'posts/create' => 'posts#create'

  resources :posts
end
