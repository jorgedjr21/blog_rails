Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, only: :index
  namespace :admin do
    resources :posts
  end

  root to: 'posts#index'
end
