Rails.application.routes.draw do
  root 'users#index'

  resources :vendors do
  	resources :products do
	  	resources :sales, only: [:create, :new]
  	end
  	collection do
	  	get :show_vendors
	  end
  	member do 
  		resources :sales, only: [:index]
  	end

  	collection do 
	  	get :search
	  end
  end

  resources :users do
  	collection do
  		get 'markets'
  		get 'markets/:id', action: "show_market", as: "show_market"
  	end
  end

  resources :markets do
  	get 'show_vendors', action: "show_vendors", as: "by_vendor"
  	get 'new_vendor/', action: "new_vendor", as: "new_vendor"
  	post 'create_vendor/', action: "create_vendor", as: "create_vendor"
  	get 'edit_vendor/:id', action: "edit_vendor", as: "edit_vendor"
  	patch 'update_vendor/:id', action: "update_vendor", as: "update_vendor"
  	delete 'delete_vendor/:id', action: "delete_vendor", as: "delete_vendor"

  	collection do
	  	get :show_markets
	  end

	  collection do 
	  	get :search
	  end
  end

end
