Rails.application.routes.draw do


  devise_for :clients, controllers: {sessions: "clients/sessions", registrations: "clients/registrations"}

  devise_scope :client do
    get "/client/sign_in" => "clients/sessions#new"  # custom path to login/sign_in
    get "/client/sign_up" => "clients/registrations#new", as: "new_client_signup" # custom path to sign_up/registration
  end
  

  devise_for :users,  controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  root 'centres#homepage'
  get '/' => 'centres#homepage'

  # error page for unauthorised access
  get '/error' => 'centres#error', as: 'error'

  # centres path
  get '/home' => 'centres#homepage', as: 'home'
  get '/dashboard' => 'centres#dashboard', as: 'dashboard'
  get '/centres' => 'centres#index', as: 'centres'
  get '/centres/new' => 'centres#new', as: 'new_centre'
  post '/centres' => 'centres#create'
  get '/centres/:id' => 'centres#show', as: 'centre'
  get '/centres/:id/edit' => 'centres#edit', as: 'edit_centre'
  patch '/centres/:id/course/:course_id' => 'centres#remove_course', as: 'remove_course' 
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
  get '/courses/:id/apply' => 'courses#apply', as: 'apply_course'
  post '/courses/:id' => 'courses#applycreate', as: 'post_apply_course'
  
  # parents path
  get '/overview' => 'parents#index', as: 'overview'
  resources :parents

  # carts path
  get '/cart/:id/edit' => 'carts#edit', as: 'edit_cart'
  patch '/cart/:id' => 'carts#update', as: 'update_cart'
  delete '/cart/:id' => 'carts#destroy', as: 'delete_cart'
    
end