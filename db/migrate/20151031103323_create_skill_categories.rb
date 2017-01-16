class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :parent_skill_category_id
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
