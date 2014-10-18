class ClothingItemsOutfits < ActiveRecord::Migration
  def change
    create_table :clothing_items_outfits, :id => false do |t|
      t.integer :clothing_item_id
      t.integer :outfit_id
    end
  end
end
