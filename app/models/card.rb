class Card < ApplicationRecord
  belongs_to :column
  has_many :comments

  def self.get_id_to_move_card(count, right_left)
    @columns = Column.order(:order)

    @columns.each_with_index do |column, index|
      if count + right_left == index then
        return column.id
      end
    end
  end

end
