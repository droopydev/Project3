Rails.application.routes.draw do

  devise_for :clients, path: 'clients', controllers: {sessions: "clients/sessions", registrations: "registrations"}
  
  devise_scope :client do
    get "/client/sign_in" => "clients/sessions#new"  # custom path to login/sign_in
    get "/client/sign_up" => "clients/registrations#new", as: "new_client_signup" # custom path to sign_up/registration
 
  end

  devise_for :users
  root 'centres#homepage'
  get '/centres/error' => 'centres#error', as: 'error'
  get '/centres' => 'centres#index', as: 'centres'
  get '/centres/new' => 'centres#new', as: 'new_centre'
  post '/centres' => 'centres#create'
  get '/centres/:id' => 'centres#show', as: 'centre'
  get '/centres/:id/edit' => 'centres#edit', as: 'edit_centre'
  patch '/centres/:id' => 'centres#update'
  delete '/centres/:id' => 'centres#destroy', as: 'delete_centre'
  
  resources :parents
end