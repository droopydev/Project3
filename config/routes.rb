Rails.application.routes.draw do
  devise_scope :user do
    root 'devise/sessions#new'
    # get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  # devise_for :users
  get '/tuitions' => 'tuitions#index', as: 'tuitions'
  get '/tuitions/new' => 'tuitions#new', as: 'new_tuition'
  post '/tuitions' => 'tuitions#create'
  get '/tuitions/:id' => 'tuitions#show', as: 'tuition'
  get '/tuitions/:id/edit' => 'tuitions#edit', as: 'edit_tuition'
  patch '/tuitions/:id' => 'tuitions#update'
  delete '/tuitions/:id' => 'tuitions#destroy', as: 'delete_tuition'

end