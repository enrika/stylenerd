class AddFormTypeToClothingItem < ActiveRecord::Migration
  def change
    add_column :clothing_items, :form_type, :string
  end
end
