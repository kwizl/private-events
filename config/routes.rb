Rails.application.routes.draw do
  resources :user_sessions, only: %i[new create destroy]

  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
