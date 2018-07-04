class AddFieldToReservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :field, foreign_key: true
  end
end
