class ParentSkillCategoriesController < ApplicationController
  # POST /parent_skill_categories
  def create
    attr = params.require(:parent_skill_category).permit(:name, :description)
    parent_skill_category = ParentSkillCategory.new(attr)
    parent_skill_category.owner = @current_user
    respond_to do |format|
      if parent_skill_category.save
        child_skill_category = ChildSkillCategory.new
        child_skill_category.owner = @current_user
        child_skill_category.parent_skill_category = parent_skill_category
        child_skill_category.save
        format.html { redirect_to skills_url, notice: 'ParentSkillCategory was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /parent_skill_categories/1
  def update
    @parent_skill_category = ParentSkillCategory.find(params[:id])

    respond_to do |format|
      attr = params.require(:parent_skill_category).permit(:name, :description)
      if @parent_skill_category.update_attributes(attr)
        format.html { redirect_to skills_url, notice: 'ParentSkillCategory was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /parent_skill_categories/1
  def destroy
    @parent_skill_category = ParentSkillCategory.find(params[:id])
    @parent_skill_category.destroy

    respond_to do |format|
      format.html { redirect_to skills_url }
    end
  end
end
