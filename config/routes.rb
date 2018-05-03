Rails.application.routes.draw do
  resources :procesors

  get '/procesors/document_download/:id', to: 'procesors#document_download'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "homes#index"
  resource :homes, only: [:index]
end
