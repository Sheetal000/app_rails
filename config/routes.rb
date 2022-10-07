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
end
