Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'likes/like' => 'likes#create'
  post 'likes/dislike' => 'likes#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments
  end
end
