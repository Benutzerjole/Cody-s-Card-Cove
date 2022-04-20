class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.references :province, null: false, foreign_key: true
      t.string :city
      t.string :zip_code
      t.references :user, null: false, foreign_key: true
      t.float :gst
      t.float :pst
      t.float :hst

      t.timestamps
    end
  end
end
