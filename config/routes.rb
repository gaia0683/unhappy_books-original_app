Rails.application.routes.draw do
  devise_for :users
  resources :books
  root 'book_searches#new'
  resources :book_searches, only: [:index, :new, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
