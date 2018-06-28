class AddAvailableToHours < ActiveRecord::Migration[5.1]
  def change
    add_column :hours, :available, :boolean, default: true
  end
end
