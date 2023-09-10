Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'users/destroy', to: 'users/sessions#destroy'
  end 
  

  get '/'=>'posts#index'
  get 'about'=>'home#about'

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get 'posts/index'
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  delete "posts/:id/destroy" => "posts#destroy"

  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "users/:id/likes" => "users#likes"

  get 'relationships/followings'
  get 'relationships/followers'

  get 'search' => 'posts#search'


    # フォロー機能
    resources :users do
      member do
        get :followings
        get :followers
      end
    end

    resources :users do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
    end


    resources :users, only: [:index, :show]
    resources :posts, only: [:index, :show, :create] do
      resources :comments, only: [:create, :show] # :showアクションのルートを追加
    end

  
end
