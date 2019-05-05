Rails.application.routes.draw do

  # Routes for main resources

  resources :customers
  resources :orders

  # Semi-static page routes
  # get 'home' => 'home#home', as: :home
  # get 'about' => 'home#about', as: :about
  # get 'contact' => 'home#contact', as: :contact
  # get 'privacy' => 'home#privacy', as: :privacy
  # get 'home/search', to: 'home#search', as: :search

  # get 'users/new', to: 'users#new', as: :signup
  # get 'user/edit', to: 'users#edit', as: :edit_current_user
  # get 'login', to: 'sessions#new', as: :login
  # get 'logout', to: 'sessions#destroy', as: :logout

  # get 'cart' => 'home#cart', as: :cart
  # get 'remove_item/:id' => 'sessions#remove_item', :as => :remove_item
  # get 'add_item/:id' => 'sessions#add_item', :as => :add_item
  # get 'remove_one_of_item/:id' => 'sessions#remove_one_of_item', :as => :remove_one_of_item

  # # Set the root url
  # root :to => 'home#home'

end
