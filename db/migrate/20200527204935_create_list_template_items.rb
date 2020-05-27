class CreateListTemplateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_template_items, id: :uuid do |t|
      t.references :list_template, null: false
      t.string     :item_type, null: false
      t.timestamps
    end
  end
end
