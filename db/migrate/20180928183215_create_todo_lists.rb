class CreateTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.string :description
      t.integer :id_user
      t.boolean :done_homework
      
      t.timestamps
    end
  end
end
