class ChangeIntegerLimitInProperties < ActiveRecord::Migration[7.0]
   def change
     change_column :properties, :phone_number, :bigint
   end 
end
