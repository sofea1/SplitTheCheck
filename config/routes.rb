Rails.application.routes.draw do
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "restaurants/:id/split" => "restaurants#split", as: "restaurants_split"
  post "restaurants/:id/nosplit" => "restaurants#nosplit", as: "restaurants_nosplit"

end
