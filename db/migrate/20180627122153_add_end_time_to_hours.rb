class AddEndTimeToHours < ActiveRecord::Migration[5.1]
  def change
    add_column :hours, :end_time, :datetime
  end
end
