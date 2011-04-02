Rails::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # resources :jobs do
  #   resources :bids
  # end
  
  resources :employers, :only => [:show, :new, :create] do
    resources :jobs
  end
  
  resources :workers, :only => [:show, :new, :create] do
    resources :jobs
  end
    
  root :to => "landing#index"
end