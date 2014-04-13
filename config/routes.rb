BostonChallenge::Application.routes.draw do
  get 'pages/about'

  devise_for :users

  resources :challenges, only: [:index, :show, :update]

  namespace :admin do
    resources :challenges
  end

  root 'challenges#index'
end
