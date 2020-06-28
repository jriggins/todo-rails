class CreateTodosTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos_todos do |t|
      t.string :uuid, null: false
      t.string :title, null: false
      t.string :description, null: true

      t.timestamps

      t.index :uuid, unique: true
    end
  end
end
