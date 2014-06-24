class AddIngredientsToItems < ActiveRecord::Migration
  def change
    add_column :items, :ingredients, :string
  end
end
