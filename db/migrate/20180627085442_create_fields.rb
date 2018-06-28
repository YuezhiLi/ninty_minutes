class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.string :title
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
