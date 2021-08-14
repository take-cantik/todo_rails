class Column < ApplicationRecord
  has_many :cards
  auto_increment :order
end
