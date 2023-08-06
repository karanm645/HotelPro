class CreateRoom < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :type
      t.decimal :price
      t.boolean :smoking
      t.integer :count
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
