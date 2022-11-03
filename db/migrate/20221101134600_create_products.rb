class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :price
      t.string :description
      t.integer :category_id
      t.string :created_by
      t.timestamps
    end
  end
end
