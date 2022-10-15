Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show' => 'users#show'
  resources :books, only: [:index]
  root 'book_searches#new'
  resources :book_searches, only: [:index, :new,:show], param: :isbn

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
