class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def account_verify
    @user = User.new(user_params)
    if @user.save
      redirect_to courses_path
    else
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
  end

  def check
    user = User.login(params[:user])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "登入成功"
    else
      redirect_to root_path, notice: "您還沒註冊或帳密輸入錯誤"
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to courses_path, notice: "已經登出"
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :is_admin)
  end
end
