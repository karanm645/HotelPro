class RemoveCountFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :count, :integer
  end
end
