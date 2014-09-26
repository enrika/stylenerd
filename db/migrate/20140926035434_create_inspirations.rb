class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
      t.string :img_url

      t.timestamps
    end
  end
end
