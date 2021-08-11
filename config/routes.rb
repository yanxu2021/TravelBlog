Rails.application.routes.draw do
  get '/travel' => 'travel#index', as:'travel'
  root 'travel#index'
  get 'travel/:id' =>'travel#show', as:'show'# referece the alias as travel_path
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
