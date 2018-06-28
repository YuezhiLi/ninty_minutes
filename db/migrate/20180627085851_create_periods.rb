class CreatePeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :periods do |t|
      t.references :hour, foreign_key: true
      t.references :reservation, foreign_key: true

      t.timestamps
    end
  end
end
