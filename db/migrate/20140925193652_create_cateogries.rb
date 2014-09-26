class CreateCateogries < ActiveRecord::Migration
  def change
    create_table :cateogries do |t|
      t.string :title

      t.timestamps
    end
  end
end
