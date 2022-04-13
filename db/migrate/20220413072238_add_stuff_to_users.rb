class AddStuffToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :province, null: false, foreign_key: true
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone_number, :string
  end
end
