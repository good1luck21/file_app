Rails.application.routes.draw do
  root 'posts#index'
  put 'posts/:id/read', to: 'posts#read', as: 'read_post'
  resources :users, only: [:new, :create, :index, :show]
  resources :posts, only: [:index, :show, :create] do
    resource :like, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
