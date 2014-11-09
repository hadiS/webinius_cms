WebiniusCms::Engine.routes.draw do

  resources :users

  resources :pages

	scope '/admin' do

		resources :users

		resources :languages

		resources :pages, only: [:index, :new, :create, :update, :edit, :destroy] do
			member do 
				get 'higher'
				get 'lower'
			end
		end
	end

	resources :sessions

	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'

	scope "(:locale)" do
		
		resources :pages, path: "", except: [:index, :new, :create, :update, :edit, :destroy]

		get "*id", to: 'pages#show'
	end

	root 'pages#show'

end
