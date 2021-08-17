class Card < ApplicationRecord
  belongs_to :column
  has_many :cards
end
