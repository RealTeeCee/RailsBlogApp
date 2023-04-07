Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'likes/action' => 'likes#update'
  post 'likes/dislike' => 'likes#remove'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments
  end
end
