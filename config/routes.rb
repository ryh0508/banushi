Rails.application.routes.draw do
  devise_for :users
  root  'banushi#index'
  get 'banushi' => 'banushi#index'
  get   'banushi/new'  =>  'banushi#new'
  post  'banushi'      =>  'banushi#create'
  delete  'posts/:id'  => 'posts#destroy'
  patch   'posts/:id'  => 'posts#update'
  get   'posts/:id/edit'  => 'posts#edit'
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  get   'users/:id'   =>  'users#show'
end
