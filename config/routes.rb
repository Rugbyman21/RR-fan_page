Rails.application.routes.draw do
  root to: 'genres#index'

  resources :genre do
    resources :artist, :only => [:create]
  end

  resources :artist do
    resources :member
  end
end
