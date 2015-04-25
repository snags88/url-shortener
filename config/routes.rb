Rails.application.routes.draw do
  root 'urls#new'

  get 'urls' => 'urls#index', as: 'urls'
  get '/:id' => 'urls#show', as: 'url'
  post 'urls' => 'urls#create'
end
