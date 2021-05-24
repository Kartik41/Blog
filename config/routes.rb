Rails.application.routes.draw do
  
  devise_for :users
  resources :friends_attachments
  #resources :post_attachments
  resources :friends 
    
  root to: 'friends#index'
  #get '/search' => 'friends#search', :as => 'search_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
