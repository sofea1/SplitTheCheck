class AddSplitNosplitToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :split, :integer
    add_column :restaurants, :nosplit, :integer
  end
end
