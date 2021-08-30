class Column < ApplicationRecord
  has_many :cards, -> { order('deadline') }
  auto_increment :order

  def self.get_swap_columns(count, right_left)
    @columns = self.order(:order)

    @columns.each_with_index do |column, index|
      if count == index then
        @original_column = column
      end

      if right_left == 0 then
        if count + 1 == index then
          @change_column = column
        end
      elsif right_left == 1 then
        if count - 1 == index then
          @change_column = column
        end
      end
    end

    return @original_column, @change_column
  end

  def self.get_id_to_move_card(count, right_left)
    @columns = self.order(:order)

    @columns.each_with_index do |column, index|
      if right_left == 0 then
        if count + 1 == index then
          return column.id
        end
      elsif right_left == 1 then
        if count - 1 == index then
          return column.id
        end
      end
    end
  end

end
