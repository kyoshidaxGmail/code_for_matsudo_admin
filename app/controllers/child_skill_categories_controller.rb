class ChildSkillCategoriesController < ApplicationController
  # GET /child_skill_categories
  def index
    @child_skill_categorcategories = ChildSkillCategory.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /child_skill_categories/new
  def new
    @child_skill_category = ChildSkillCategory.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /child_skill_categories/1/edit
  def edit
    @child_skill_category = ChildSkillCategory.find(params[:id])
  end

  # POST /child_skill_categories
  def create
    @child_skill_category = ChildSkillCategory.new(params[:child_skill_category])

    respond_to do |format|
      if @child_skill_category.save
        format.html { redirect_to child_skill_categories_url, notice: 'ChildSkillCategory was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /child_skill_categories/1
  def update
    @child_skill_category = ChildSkillCategory.find(params[:id])

    respond_to do |format|
      if @child_skill_category.update_attributes(params[:child_skill_category])
        format.html { redirect_to child_skill_categories_url, notice: 'ChildSkillCategory was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /child_skill_categories/1
  def destroy
    @child_skill_category = ChildSkillCategory.find(params[:id])
    @child_skill_category.destroy

    respond_to do |format|
      format.html { redirect_to child_skill_categories_url }
    end
  end
end
