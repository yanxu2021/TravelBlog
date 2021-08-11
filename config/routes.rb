Rails.application.routes.draw do
  get '/travels' => 'travel#index', as:'travels'
  get '/travels/new' => 'travel#new', as:'new'
  get '/travels/:id' =>'travel#show', as:'show'
  post '/travels' =>'travel#create'
  delete '/travels/:id' => 'travel#destroy', as: 'delete'
  root 'travel#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
