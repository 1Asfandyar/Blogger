# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  devise_scope :user do
    authenticated do
      root to: 'home#index'
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  get 'home', to: 'home#index'

  resources :likes, only: %i[create destroy]
  resources :reports, only: %i[index create destroy]
  resources :suggestions, only: %i[create new index destroy]

  resources :posts do
    resource :comments, only: %i[create destroy new] do
      member do
        put 'like', to: 'comments#vote'
      end
    end
    member do
      put 'like', to: 'posts#vote'
      patch :publish, as: 'publish'
      patch :unpublish, as: 'unpublish'
    end
  end
end
