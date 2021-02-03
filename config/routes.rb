Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
