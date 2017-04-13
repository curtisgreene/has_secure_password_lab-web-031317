class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if passwords_match
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to homepage_path(@user)
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def passwords_match
    params[:user][:password] == params[:user][:password_confirmation]
  end

end
