Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end

  put '/post/:id/like', to: 'posts#like', as: 'like'

  
end
