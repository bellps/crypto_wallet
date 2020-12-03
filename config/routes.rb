Rails.application.routes.draw do
  resources :mining_types
  get 'teste/ajudar'

  get 'teste/pegar'

  get 'teste/mostrar'

  get 'welcome/index'

  resources :coins

  # ex: 
  # get '/coins', to: 'coins#index'
  # cria uma rota pra uma ação específica

  root 'welcome#index'
  # o root da aplicação (localhost...) cai na welcome direto
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
