Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/home',    to: 'static_pages#home'
  get  '/show',    to: 'static_pages#show'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup_designated',  to: 'users#new_designated'
  post '/signup_designated',  to: 'users#create_designated'
  post '/notices/:notice_id/reject', to: 'notices#reject', as: 'notice_reject'
  patch '/accounts/:account_id/reject', to: 'accounts#reject', as: 'account_reject' 
  
  resources :users do
    member do
      get :following, :followers
      get :likes
      get :messages
      get :notification
    end
  end
  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  
  #投稿に対してのお気に入り，共有，コメント
  resources :microposts do
    resources :likes,  only: [:create, :destroy]
    resources :shares, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  resources :notices
  resources :accounts
  resources :messages, only: [:create, :index]
  get  '/messages/:user_id', to: 'messages#show'

end
