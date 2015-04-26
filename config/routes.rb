Rails.application.routes.draw do
  root 'urls#new'
  get '/:id' => 'urls#show', as: 'url'
  post 'urls' => 'urls#create'
end
