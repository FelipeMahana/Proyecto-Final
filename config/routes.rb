Rails.application.routes.draw do


  #get 'programs/index'

  	devise_for :users, controllers: {
        sessions: 'users/sessions'

   	}

    
    resources :plans, only: [:index, :user_contracts] do
     	resources  :contracts, only: [:index, :show, :create, :new, :edit, :update] do
        resources :user, only: [] do
          resources :programs, only: [:new,:create, :edit, :show]
        end 
      end
    end
   	
    get 'profile', to: 'plans#profile'
   	get 'user_contracts', to: 'plans#user_contracts'
    get 'user_programs', to: 'programs#user_programs' 
   	root 'plans#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
