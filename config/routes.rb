Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
resources :temperatures, path: ''
  root "temperatures#index"
  post "/fetch_temp" => "temperatures#fetch_temp"
end
