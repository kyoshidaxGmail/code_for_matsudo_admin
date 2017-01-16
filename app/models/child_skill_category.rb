class ChildSkillCategory < SkillCategory
  belongs_to :parent_skill_category
  has_many :skills
end
