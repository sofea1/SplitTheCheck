class RemoveSplitNosplitFromRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :split, :integer
    remove_column :restaurants, :nosplit, :integer
  end
end
