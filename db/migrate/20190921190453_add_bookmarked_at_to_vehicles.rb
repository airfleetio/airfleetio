class AddBookmarkedAtToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :bookmarked_at, :timestamp
    add_index :vehicles, :bookmarked_at
    remove_column :vehicles, :bookmarked, :boolean, default: false
  end
end
