class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :base_price
      t.float :sale_price
      t.integer :quantity_in_stock
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
