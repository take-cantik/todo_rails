class Column < ApplicationRecord
  has_many :cards, -> { order('deadline') }
  belongs_to :user
  auto_increment :order

  def self.get_swap_columns(count, right_left)
    @columns = self.order(:order)

    @columns.each_with_index do |column, index|
      if count == index then
        @original_column = column
      end

      if count + right_left == index then
        @change_column = column
      end
    end

    return @original_column, @change_column
  end

  # def self.get_id_to_move_card(count, right_left)
  #   @columns = self.order(:order)

  #   @columns.each_with_index do |column, index|
  #     if count + right_left == index then
  #       return column.id
  #     end
  #   end
  # end

end
