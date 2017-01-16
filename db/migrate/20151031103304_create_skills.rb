class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.boolean :status
      t.text :description
      t.integer :child_skill_category_id
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
