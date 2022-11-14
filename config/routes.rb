Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update,]
  get "/home/about" => "home#about", as: "about"
  
  #get "users/show" => "users#show", as: "show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
