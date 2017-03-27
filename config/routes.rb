WebiniusCms::Engine.routes.draw do

  resources :images
  # resources :users

  # resources :pages

  resources :documents, only: :show

  scope '/admin' do

    resources :users

    resources :languages

    resources :pages, only: [:index, :new, :create, :update, :edit, :destroy] do
      member do
        get 'higher'
        get 'lower'
      end
    end

    resources :lists do
      resources :list_items do
        member do
          get 'higher'
          get 'lower'
        end
      end
    end
  end

  resources :sessions

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  scope "(:locale)" do

    # resources :pages, path: "", except: [:index, :new, :create, :update, :edit, :destroy]
    # get "*id/:list_item_id", to: 'list_items#show'

    get "*id", to: 'pages#show'
  end

  root 'pages#show'

end
