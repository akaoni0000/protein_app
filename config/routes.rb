Rails.application.routes.draw do

  # homesコントローラー
  root "homes#top"
  get "login" => "homes#user_login"

  # usersコントローラー
  post "/users/login" => "users#login"
  post "/users/logout" => "users#logout"
  post "/users/destroy_image" => "users#destroy_image"
  resources :users, except: [:destroy, :index]

  # proteinsコントローラ
  post "/proteins/image_destroy" => "proteins#image_destroy"
  get "/proteins/search" => "proteins#search"
  get "/proteins/sort" => "proteins#sort"
  resources :proteins

  # commentsコントローラー
  resources :comments, only: [:create, :destroy]

  # favoritesコントローラー
  resources :favorites, only: [:create, :destroy]

  # relationsコントローラー
  post "relations/follow/:id" => "relations#follow", as: "relations_follow"
  post "relations/unfollow/:id" => "relations#unfollow", as: "relations_unfollow"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
