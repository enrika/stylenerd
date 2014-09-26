class CreateClothingItems < ActiveRecord::Migration
  def change
    create_table :clothing_items do |t|
      t.string :title
      t.string :color
      t.string :clothing_type
      t.string :form_type
      t.string :img_url

      t.timestamps
    end
  end
end
