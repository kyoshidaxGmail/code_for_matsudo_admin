class Skill < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :child_skill_category

  has_many :user_skill_scores
  has_many :users, :through => :user_skill_scores
end
