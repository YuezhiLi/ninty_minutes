class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :open_id
      t.string :nickname
      t.string :avatar_url

      t.timestamps
    end
  end
end
