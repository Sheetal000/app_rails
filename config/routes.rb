Rails.application.routes.draw do
  get 'clients/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/clients/:status', to: 'clients#index', foo: 'bar'


end
