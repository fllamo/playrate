Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'custom_devise/registrations' }
  
  resources :schools, only: [:index] do
    get 'submit'
    
    collection do
      get 'my'
      get 'search'
    end
  end

  resources :player_profiles do
    get 'note_book/edit', to: 'note_books#edit'
    patch 'note_book', to: 'note_books#update'
  end

  resources :teams, only: :create
  resources :testimonials, only: [:create, :edit, :update]

  resources :highlights, only: [:create, :destroy]

  resources :positions, only: :index do
    collection do
      get 'player_form'
    end
  end

  resources :position_searches, except: [:index, :show, :update] do
    collection do
      get 'position_search_form'
    end
  end

  resources :matches, only: [:index, :destroy]
  resources :conversations, only: [:index, :update] do
    collection do
      get 'show', as: :show
    end
  end

  get 'dashboard/index'
  get 'dashboard/add_to_dash'
  get 'pages/account_redirect'
  root :to => "pages#landing"
end
