class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status, null: false, default: 0
      t.references :creator
      t.references :assignee

      t.timestamps
    end
  end
end
