class AddImageToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :title_image, :string
  end
end
