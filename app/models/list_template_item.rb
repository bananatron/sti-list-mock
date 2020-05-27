class ListTemplateItem < ApplicationRecord
  belongs_to :list_template
  # validates :item_type, inclusion: { in: ListItem.descendants }

  def build_item
    item_type.constantize.new
  end
end
