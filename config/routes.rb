Seddit::Application.routes.draw do
  devise_for :users

  root to: "homes#index"

  resources :posts
end

