class CreateBookinngs < ActiveRecord::Migration[5.1]
  def change
    create_table :bookinngs do |t|
      t.references :user, foreign_key: true
      t.references :reservation, foreign_key: true

      t.timestamps
    end
  end
end
