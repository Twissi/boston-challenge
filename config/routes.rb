BostonChallenge::Application.routes.draw do
  get 'pages/about'

  devise_for :users

  resources :challenges
  resources :frontend_challenges, only: [:index, :update]

  root 'frontend_challenges#index'
end
