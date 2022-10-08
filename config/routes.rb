Rails.application.routes.draw do
  resources :users
  resources :admins
  # resource :login
  resources :posts
  resources :clients do
    get '/download_pdf', to: 'clients#download_pdf'
    # get '/login' , to: 'login#show'
  end
   resources :login , only: [:show,:create]
  # GET /clients/1.pdf

  get "/stream" , to: "my#stream"
  # get '/previews', to: 'comments#previews'
  resources :comments do 
    get 'previews', on: :new
  end
  # get '/photos' , to: 'photos#show'
  get 'photos(/:id)', to: 'photos#show'
  # get 'photos/:id/:user_id', to: 'photos#show'
  # get 'photos/:id/with_user/:user_id', to: 'photos#show'
  # get 'photos/:id', to: 'photos#show'
  defaults format: :json do
    resources :photos
  end
  # get 'exit', to: 'sessions#destroy', as: :logout
  # get ':username', to: 'photos#show', as: :photo
  # resources :photos
  match 'photos',to: 'photo#show',via: :all
  get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }
  get  '/photos', to: redirect('/users')
  
end
