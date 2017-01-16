class UserSkillScoresController < ApplicationController
  # POST /user_skill_scores
  def create
    user_skill_score = UserSkillScore.new
    user_skill_score.skill_id = params[:skill_id]
    user_skill_score.user_id = params[:user_id]
    user_skill_score.score = params[:skill_score]

    respond_to do |format|
      if user_skill_score.save
        format.html { redirect_to "/users/#{params[:user_id]}", notice: 'ParentSkillCategory was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /user_skill_scores/1
  def update
    user_skill_score = UserSkillScore.find(params[:id])
    user_skill_score.score = params[:skill_score]

    respond_to do |format|
      if user_skill_score.save
        format.html { redirect_to "/users/#{params[:user_id]}", notice: 'ParentSkillCategory was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /user_skill_scores/1
  def destroy
    @user_skill_score = ParentSkillCategory.find(params[:id])
    @user_skill_score.destroy

    respond_to do |format|
      format.html { redirect_to user_skill_scores_url }
    end
  end
end
