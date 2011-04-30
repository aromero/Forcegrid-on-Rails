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
  
  match '/api/skills' => 'xhr#skills'
    
  root :to => "landing#show"
end