Logs::Engine.routes.draw do
  root 'logs#index'

  get '/download', to: 'logs#download'
  get '/tail', to: 'logs#tail'
  get ':name', to: 'logs#show'

  resources :logs, only: %i[index show]
end
