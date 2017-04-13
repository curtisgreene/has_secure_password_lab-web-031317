class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user][:password].present? && params[:user][:name].present?
      @user = User.find_by(name: params[:user][:name])
      if @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        flash[:message] = "Good job"
        redirect_to homepage_path(@user)
      else
        flash[:message] = "Go away"
        redirect_to login_path
      end
    else
      flash[:message] = "Go away"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
