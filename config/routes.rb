GithubFantasyLeague::Application.routes.draw do
  resources :users, :only => [ :create ]
  root :to => 'home#index'
end
