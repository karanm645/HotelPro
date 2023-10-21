class AddVacantToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :vacant, :boolean
  end
end
