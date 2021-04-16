Rails.application.routes.draw do
  resources :vote_histories
  devise_for :users
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'restaurants#index'
 post "restaurants/:id/split" => "restaurants#split", as: "restaurants_split"
 post "restaurants/:id/nosplit" => "restaurants#nosplit", as: "restaurants_nosplit"
   
  #post "restaurants/:id/split" => "vote_histories#split", as: "restaurants_split"

end
