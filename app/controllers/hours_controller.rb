class HoursController < ApplicationController
  before_action :require_user
  before_action :require_admin, only: [:update, :index, :show]
  def index
    @allhours = HourLog.where(status:'Pending')
    @allconfirm = HourLog.where(status:'Confirmed')
    @alltotal = HourLog.sum(:hours)
  end
  def show
    @hour = HourLog.find(params[:id])
    @status = @hour.status
  end
  def update
    @hour = HourLog.find(params[:id])
    if @hour.update_attributes(update_hour_params)
      redirect_to '/hours'
    else
      redirect_to "/hours/#{id}"
    end
  end
  def new
    @hour = current_user.hour_logs.new
    @entry = current_user.hour_logs.all
    @total = current_user.hour_logs.where(status:"Confirmed").sum(:hours)
  end
  def create
    @hour = HourLog.new(hour_params)
    @hour.user_id = current_user.id if current_user
    @hour.status = 'Pending'
    if @hour.save
      redirect_to '/hours/new'
    end
  end
  def destroy
    @hourdelete = HourLog.find(params[:id]).destroy
    redirect_to '/hours'
  end
  private
  def hour_params
    params.require(:hour_log).permit(:assignment, :hours, :supervisor, :date)
  end
  def update_hour_params
    params.require(:hour_log).permit(:status)
  end
end
