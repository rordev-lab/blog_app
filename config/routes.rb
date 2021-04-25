# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  root 'home#index'

  devise_for :users
  resources :posts do
    resources :comments
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :posts do
      resources :comments
    end
  end
end
