class AddConfirmedToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :confirmed, :boolean, default: false
  end
end
