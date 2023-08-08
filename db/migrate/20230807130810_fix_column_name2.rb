class FixColumnName2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :rooms, :smk, :room_type
  end
end