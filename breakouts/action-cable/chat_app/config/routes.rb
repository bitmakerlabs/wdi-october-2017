Rails.application.routes.draw do

  root 'chat#login'
  post 'add_user'  => 'chat#add_user'
  get  'chat_room' => 'chat#chat_room'

end
