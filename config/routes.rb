Rails.application.routes.draw do

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end

  resources :welcome
  resources :users, only: [:show, :edit, :update]
  root 'welcome#index'

  resources :analyses, only: [:show, :index]
  get '/analyses/watson/:email' => 'analyses#watson'
  resources :emails, only: [:show]

end
