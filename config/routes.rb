Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "pages#home"
  get "posts/:id/edit", to: "posts#edit"
  patch "posts/:id", to: "posts#update"
  delete "posts/:id", to: "posts#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show]
  resources :categories, only: [:show]
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update] do
  resources :comments, only: :create
  end
end
