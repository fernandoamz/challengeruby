class AddIdUserToTablename < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :id_user, :integer
  end
end
