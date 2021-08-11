Rails.application.routes.draw do
  get '/travel' => 'travel#index'
  root 'travel#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
