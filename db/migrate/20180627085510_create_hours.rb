class CreateHours < ActiveRecord::Migration[5.1]
  def change
    create_table :hours do |t|
      t.datetime :start_time
      t.references :field, foreign_key: true

      t.timestamps
    end
  end
end
