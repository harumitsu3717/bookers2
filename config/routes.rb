Rails.application.routes.draw do
  get 'homes/top'
  get 'home/about' => 'homes#about', as: "about"
  devise_for :users
  root to: 'homes#top'

  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]

  resources :users, only: [:index, :show, :edit, :update]


  get "/" => "homes#top", as: "top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
