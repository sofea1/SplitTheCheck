Rails.application.routes.draw do
  resources :comments
  resources :vote_histories
  devise_for :users
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root 'restaurants#index'
 post "restaurants/:id/split" => "restaurants#split", as: "restaurants_split"
 post "restaurants/:id/nosplit" => "restaurants#nosplit", as: "restaurants_nosplit"
 get "restaurants/:id/comment/new" => "restaurants#new_comment", as: "restaurants_new_comment"

 post "restaurants/:id/comment" => "restaurants#add_comment", as: "restaurants_add_comment"

 
end


