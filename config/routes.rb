Rails.application.routes.draw do
  devise_for :users
  get 'home/top'=>'home#top'
  get 'about'=>'home#about'
  get "users/index" => "users#index"
end
