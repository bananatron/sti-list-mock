class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists, id: :uuid do |t|
      t.string :name, null: false
      t.datetime :completed_at
      t.timestamps
    end
  end
end
