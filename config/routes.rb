Rails.application.routes.draw do
	
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :projects do 
    resources :tasks do
    	resources :comments do
        resources :docs
      end
    end
  end 

  root to: 'pages#home'
  
  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end
end
