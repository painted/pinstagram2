Rails.application.routes.draw do

	devise_for :users
	root to: "posts#index"
	
	resources :posts do 
		resource :map
	end

	resources :tags

end