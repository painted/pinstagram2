Rails.application.routes.draw do

  
	devise_for :users
	devise_for :admins
	root to: "posts#index"
	
	resources :posts do 
		resource :map
	end

	resources :tags
	resources :orders

end