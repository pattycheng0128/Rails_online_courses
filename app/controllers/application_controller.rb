class ApplicationController < ActionController::Base

  before_action :set_ransack_obj

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  helper_method :user_signed_in?,:current_user

  private
  def record_not_found
    render file: 'public/404.png', layout: false, status: 404
  end

  def set_ransack_obj
    @q = Course.ransack(params[:q])
  end

  def user_signed_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate!
    redirect_to sign_in_path, notice: "請先登入會員" unless user_signed_in? 
  end
  
end
