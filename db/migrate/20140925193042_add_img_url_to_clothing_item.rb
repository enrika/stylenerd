class AddImgUrlToClothingItem < ActiveRecord::Migration
  def change
    add_column :clothing_items, :img_url, :string
  end
end
