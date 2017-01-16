class CreateUserSkillScores < ActiveRecord::Migration
  def change
    create_table :user_skill_scores do |t|
      t.integer :user_id
      t.integer :skill_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
