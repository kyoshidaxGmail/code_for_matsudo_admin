class SkillsController < ApplicationController
  # GET /skills
  def index
    @parent_skill_categories = ParentSkillCategory.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /skills
  def create
    attr = params.require(:skill).permit(:name, :description)
    skill = Skill.new(attr)
    parent_skill_category = ParentSkillCategory.where(:id => params[:parent_skill_category_id]).first
    child_skill_category = parent_skill_category.child_skill_categories.first
    skill.child_skill_category = child_skill_category
    skill.owner = @current_user
    respond_to do |format|
      if skill.save
        format.html { redirect_to skills_url, notice: 'Skill was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /skills/1
  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      attr = params.require(:skill).permit(:name, :description)
      if @skill.update_attributes(attr)
        format.html { redirect_to skills_url, notice: 'Skill was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /skills/1
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url }
    end
  end
end
