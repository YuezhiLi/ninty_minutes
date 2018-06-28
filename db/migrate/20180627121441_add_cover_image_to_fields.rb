class AddCoverImageToFields < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :cover_image, :string
  end
end
