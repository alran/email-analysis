Rails.application.routes.draw do

  root 'welcome#index'

  resources :analyses, only: [:show, :index]

  # post 'welcome#watson_tone_analysis'

end
