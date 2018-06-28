class ChangeBookinngsToBookings < ActiveRecord::Migration[5.1]
  def change
    rename_table :bookinngs, :bookings
  end
end
