Rails.application.routes.draw do
  devise_for :users
  get 'home/top'=>'home#top'
  get 'about'=>'home#about'
end
