Rails.application.routes.draw do
  root "chatrooms#index"

  devise_for :users

  post 'create', to: 'messages#create', as: 'create_message'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
