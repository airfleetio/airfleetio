class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :vin, null: false, index: {unique: true}
      t.integer :uuid, null: false
      t.string :year, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.float :efficiency

      t.timestamps
    end
  end
end
