Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :sessions, only: [:new, :create]
  resources :inversions, only: [:index, :new, :create, :edit, :update]
  resources :groups, only: [:index, :show, :new, :create, :edit, :update]

  get 'sign_out' => 'sessions#destroy'
  get 'external' => 'inversions#external'
end
