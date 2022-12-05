Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show]
  resources :categories, only: [:show]
  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: :create
  end
  resources :comments, only: :destroy
end
