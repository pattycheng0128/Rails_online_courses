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
      redirect_to "/"
    else
      render :sign_in, notice: "no user"
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to courses_path, notice: "已經登出"
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
