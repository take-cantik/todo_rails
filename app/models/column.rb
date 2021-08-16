class Column < ApplicationRecord
  has_many :cards, -> { order('deadline') }
  auto_increment :order
end
