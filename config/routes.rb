Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show' => 'users#show'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root 'books#index'
  resources :book_searches, only: [:index, :new,:show], param: :isbn
  resources :books, only: [:index, :show] do
    resources :reviews, except: [:index,:new,:create,:show]
  end
  resources :reviews, only: [:index,:new,:create]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
