class CreateOccupiedRoom < ActiveRecord::Migration[7.0]
  def change
    create_table :occupied_rooms do |t|
      t.references :room, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
