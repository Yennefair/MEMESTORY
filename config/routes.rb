Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about'

  resources :memes do
    member do
      put "upvote" => "memes#upvote"
      put "downvote" => "memes#downvote"
    end
  end

end
