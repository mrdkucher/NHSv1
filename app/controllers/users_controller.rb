class UsersController < ApplicationController
  before_action :require_admin, only: [:update, :index, :show]
  def new
    @user = User.new
  end
  def index
    @allusers = User.all
  end
  def show
    @user = User.find(params[:id])
    @role = @user.role
  end
  def update
    @user = User.find(params[:id])
    if @user.update(update_user_params)
      redirect_to '/users'
    else
      redirect_to "/users/#{id}"
    end
  end
  def create
    @user = User.new(user_params)
    @user.role = 'User'
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/hours/new'
    else
      redirect_to '/signup'
    end
  end
  def destroy
    @userdelete = User.find(params[:id])
    @hourdelete = HourLog.where(user_id: @userdelete.id)
    @hourdelete.each do |delete|
      delete.destroy
    end
    @userdelete.destroy
    redirect_to '/users'
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  def update_user_params
    params.require(:user).permit(:role)
  end
end
