class CreateTodosTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos_todos do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
