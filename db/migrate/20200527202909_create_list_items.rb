class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items, id: :uuid  do |t|
      t.string     :type, null: false
      t.references :list, null: false
      t.jsonb      :meta, null: false, default: {}

      t.datetime   :approved_at
      t.datetime   :rejected_at
      t.timestamps
    end
  end
end
