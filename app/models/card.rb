class Card < ApplicationRecord
  belongs_to :column
  has_many :comments

  def self.get_column_id_to_move_card(user_id, count, right_left)
    @columns = User.find(user_id).columns.order(:order)

    @columns.each_with_index do |column, index|
      if count + right_left == index then
        return column.id
      end
    end
  end

  def self.new_comment
    return Comment.new
  end

  def self.get_user_id(column_id)
    @column = Column.find(column_id)
    return @column.user_id
  end

  def self.all_find_user(user_id)
    user = User.includes(columns: :cards).find(user_id)
    return user.columns.map{ |column| column.cards }.flatten
  end

end
