class CreateReservation < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date_in
      t.date :date_out
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
