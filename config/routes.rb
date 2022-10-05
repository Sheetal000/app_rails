Rails.application.routes.draw do
  resources :users
  resources :admins
  resources :posts
  resources :clients do
    get '/download_pdf', to: 'clients#download_pdf'
  end

  # GET /clients/1.pdf

  get "/stream" , to: "my#stream"
end
