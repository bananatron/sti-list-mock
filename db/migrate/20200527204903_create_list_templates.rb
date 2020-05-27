class CreateListTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :list_templates, id: :uuid do |t|
      # belongs to entity
      t.string :name, null: false
      t.timestamps
    end
  end
end
