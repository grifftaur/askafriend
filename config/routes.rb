Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
      member do
        put "like", to: "comments#upvote"
        put "dislike", to: "comments#downvote"
      end
  end
  root 'posts#index'
end
