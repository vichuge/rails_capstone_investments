Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:create]
  resources :inversions, only: [:index, :new, :create]
  resources :groups, only: [:index, :show, :new, :create]

  get 'sign_out' => 'sessions#destroy'
  get 'external' => 'inversions#external'
end
