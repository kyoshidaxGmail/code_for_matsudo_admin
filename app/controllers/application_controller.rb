class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_current_user
  before_action :force_check_in

  def force_check_in
    if @current_user.blank? && params[:action] != 'sign_up' && params[:action] != 'sign_in' && params[:action] != 'do_sign_up' && params[:action] != 'do_sign_in'
      redirect_to '/sign_up'
    end
  end

  def get_current_user
    @current_user = User.where('id = ?', session[:user_id]).first if session[:user_id].present?
  end
end
