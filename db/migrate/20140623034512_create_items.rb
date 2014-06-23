class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, :precision => 13, :scale => 2
      t.string :description
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
