class ChangeColumnUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :todo_lists, :user_id, :user_id
  end
end
