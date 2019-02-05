Rails.application.routes.draw do


  devise_for :clients, path: 'clients', controllers: {sessions: "clients/sessions"}

  devise_scope :client do
    get "/client/sign_in" => "clients/sessions#new"  # custom path to login/sign_in
    get "/client/sign_up" => "clients/registrations#new", as: "new_client_signup" # custom path to sign_up/registration
 
  end

  devise_for :users
  root 'centres#homepage'

  # error page for unauthorised access
  get '/error' => 'centres#error', as: 'error'

  # centres path
  get '/home' => 'centres#homepage', as: 'home'
  get '/centres' => 'centres#index', as: 'centres'
  get '/centres/new' => 'centres#new', as: 'new_centre'
  post '/centres' => 'centres#create'
  get '/centres/:id' => 'centres#show', as: 'centre'
  get '/centres/:id/edit' => 'centres#edit', as: 'edit_centre'
  patch '/centres/:id' => 'centres#update'
  delete '/centres/:id' => 'centres#destroy', as: 'delete_centre'
  

  # courses path
  get '/courses' => 'courses#index', as: 'courses'
  get '/courses/new' => 'courses#new', as: 'new_course'
  post '/courses' => 'courses#create'
  get '/courses/:id' => 'courses#show', as: 'course'
  get '/courses/:id/edit' => 'courses#edit', as: 'edit_course'
  patch '/courses/:id' => 'courses#update'
  delete '/courses/:id' => 'courses#destroy', as: 'delete_course'
  
  resources :parents
end