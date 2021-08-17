class Card < ApplicationRecord
  belongs_to :column
  has_many :comments
end
