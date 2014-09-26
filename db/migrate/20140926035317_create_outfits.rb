class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.string :title
      t.string :img_url

      t.timestamps
    end
  end
end
