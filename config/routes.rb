Rails.application.routes.draw do
  resources :user_sessions, only: %i[new create destroy]
  resources :events, only: %i[index new create show]
  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
  post 'assist_event' => 'events#assist_event'
  resources :users
  root to: 'events#index'
end
