class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt
      t.text :description
      t.string :type
      t.string :mail_address
      t.string :zip_address
      t.string :dial_number

      t.timestamps null: false
    end
  end
end
