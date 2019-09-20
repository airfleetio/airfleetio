class AddBookmarkedToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :bookmarked, :boolean, default: false, index: true
  end
end
