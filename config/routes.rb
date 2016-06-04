Rails.application.routes.draw do

  root 'welcome#index'

  resources :analyses, only: [:show, :index]

end
