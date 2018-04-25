Rails.application.routes.draw do
  root 'lists#index'
  resources :lists
  delete 'lists/:id', to: 'lists#destroy', as: 'delete_list'
end
