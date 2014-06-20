class AddRestaurantIdToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :restaurant_id, :integer
  end
end
