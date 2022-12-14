Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'top#index'
  get 'users/show' => 'users#show'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  resources :book_searches, only: [:index,:new,:show], param: :isbn
  resources :books, only: [:index, :show] do
    resources :reviews, except: [:index,:show]
  end
  resources :another_reviews, only: [:new,:create]
  resources :favorites, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
