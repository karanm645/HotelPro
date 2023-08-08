class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :rooms, :type, :smk
  end
end
