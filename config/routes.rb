Workspace::Application.routes.draw do
  resources :folders, only: [:index, :new, :create]
  resources :directories, :documents, only: [:new, :create]

  root to: 'folders#index'
end
