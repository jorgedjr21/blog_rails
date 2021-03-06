Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, only: %i[index show] do
    resources :comments
  end
  namespace :admin do
    resources :posts
    root to: 'posts#index'
  end

  root to: 'posts#index'
end
