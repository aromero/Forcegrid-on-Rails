ActionController::Routing::Routes.draw do |map|
  map.resources :bids
  map.resources :jobs, :has_one => [:employer, :bid]
  map.resources :employers, :has_many => :jobs
  map.resources :workers, :has_many => [:jobs, :bids]
  
  map.resource :account, :controller => 'users'
  map.resources :users
  map.resource :user_session
  
  map.root :controller => "main/home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
