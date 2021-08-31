class AddUserIdToColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :columns, :user_id, :integer
  end
end
