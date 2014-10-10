class AddFilePickerUrltoClothingItems < ActiveRecord::Migration
  def change
     add_column :clothing_items, :filepicker_url, :string
  end
end
