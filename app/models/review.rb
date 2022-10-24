class Review < ApplicationRecord
  has_many :ratings,dependent: :destroy
  accepts_nested_attributes_for :ratings, allow_destroy: true
  has_many :likes, dependent: :destroy
  belongs_to :book
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
end
