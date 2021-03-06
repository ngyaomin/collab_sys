Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :comments
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  root "posts#index"

end
