Rails.application.routes.draw do
  devise_for :clients
  resources :parents
  root 'tuitions#index'
  get '/tuitions/new' => 'tuitions#new', as: 'new_tuition'
  post '/tuitions' => 'tuitions#create'
  get '/tuitions/:id' => 'tuitions#show', as: 'tuition'
  get '/tuitions/:id/edit' => 'tuitions#edit', as: 'edit_tuition'
  patch '/tuitions/:id' => 'tuitions#update'
end