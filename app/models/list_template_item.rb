class ListTemplateItem < ApplicationRecord
  belongs_to :list_template

  def build_item
    item_type.constantize.new
  end
end
