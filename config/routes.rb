ITPARC::Application.routes.draw do |map|
  resources :jobs do
    resources :bids
  end
  
  resources :employers do
    resources :jobs
  end
  
  resources :workers do
    resources :jobs
  end
  
  resource :account, :controller => 'users'
  resource :user_session
  
  
  match 'register/:activation_code' => 'activations#new', :as => :register
  match 'activate/:id' => 'activations#create', :as => :activate
  
  #flujo de login
  match 'account/choose' => 'users#choose', :as => :choose_acount
  match 'account/worker_signup' => 'users#worker_signup'
  match 'account/employer_singup' => 'users#employer_signup'
    
  root :to => "landing#index"
end