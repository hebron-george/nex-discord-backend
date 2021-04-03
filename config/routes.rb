Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/find-quote', to: 'quotes#find_quote'
  post '/add-quote',  to: 'quotes#add_quote'

  root to: 'pages#home'
end
