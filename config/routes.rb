Rails.application.routes.draw do
  get '/travels' => 'travel#index', as:'travels'
  get '/travels/new' => 'travel#new', as:'new_travel'
  get '/travels/:id' =>'travel#show', as:'travel'
  post '/travels' =>'travel#create'
  delete '/travels/:id' => 'travel#destroy', as: 'delete_travel'
  get '/travels/:id/edit' => 'travel#edit', as: 'edit_travel'
  patch '/travels/:id' => 'travel#update'
  root 'travel#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
