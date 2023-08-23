class AddPropertyRefToGuests < ActiveRecord::Migration[7.0]
  def change
    add_reference :guests, :property, foreign_key: true
  end
end
