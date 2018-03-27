Rails.application.routes.draw do


  	devise_for :users, controllers: {
        sessions: 'users/sessions'

   	}

    
    resources :plans, only: [:index, :user_contracts] do
     	resources  :contracts, only: [:index, :show, :create, :new, :edit, :update]
    end
   	
   	get 'user_contracts', to: 'plans#user_contracts' 
   	root 'plans#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
