class CreateAboutInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :about_infos do |t|
      t.text :description
      t.string :phone_number
      t.string :email
      t.string :twitter
      t.string :facebook
      t.string :instagram

      t.timestamps
    end
  end
end
