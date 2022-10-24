class Category < ApplicationRecord
  belongs_to :review, optional: true
  validates :name, uniqueness: true
  enum name: {
    後味悪い: 1,
    読み応えがある: 2
  }
end
