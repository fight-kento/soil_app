Rails.application.routes.draw do
  get 'home/top'=>'home#top'
  get 'about'=>'home#about'
end
