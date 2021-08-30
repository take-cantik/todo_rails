class Column < ApplicationRecord
  has_many :cards, -> { order('deadline') }
  belongs_to :user
  auto_increment :order
end
