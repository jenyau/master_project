class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :weight
      t.integer :category, default: 0
      t.timestamps
    end
  end
end
