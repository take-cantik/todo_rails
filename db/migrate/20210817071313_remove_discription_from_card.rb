class RemoveDiscriptionFromCard < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :discription, :text
  end
end
