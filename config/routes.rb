Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :users, only: [:new, :create]

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
end
