Rails.application.routes.draw do
  root :to => 'genres#index'

  resources :genres do
    resources :artists, :only => [:create, :new]
  end

  resources :artists, :except => [:create, :new] do
    resources :members
    resources :reviews
  end
end
