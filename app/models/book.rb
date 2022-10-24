class Book < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :reviews
end
