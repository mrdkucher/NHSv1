class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/hours/new'
    else
      redirect_to '/login'
      flash[:error] = "Oh No! You're not logged in! Try again or Sign Up for an Account."
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end