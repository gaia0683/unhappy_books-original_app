class Category < ApplicationRecord
  belongs_to :review, optional: true
  validates :name, uniqueness: true
  enum name: {
    後味悪い: 1,
    読み応えがある: 2,
    読了後の脱力感: 3,
    重たい:4,
    恐怖: 5
  }
end
