Rails.application.routes.draw do

  root 'lists#index'

  resources :lists do
    resources :items
  end

end
