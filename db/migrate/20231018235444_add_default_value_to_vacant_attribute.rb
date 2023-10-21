class AddDefaultValueToVacantAttribute < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :vacant, :boolean, default: true
  end
end
