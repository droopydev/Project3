Rails.application.routes.draw do

  # devise_scope :user do
  # #   get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
  #   get "/users/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  # end

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

  get '/courses' => 'courses#index', as: 'courses'
  get '/courses/new' => 'courses#new', as: 'new_course'
  post '/courses' => 'courses#create'
  
  resources :parents
end