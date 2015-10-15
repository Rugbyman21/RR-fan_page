Rails.application.routes.draw do
  root :to => "pages#index"

  resources :pages, :only => [:index]

  resources :members, :only => [:index]

  resources :reviews, :only => [:index]

  resources :genres do
    resources :artists, :only => [:create, :new]
  end

  resources :artists, :except => [:create, :new] do
    resources :members
    resources :reviews
  end


end
