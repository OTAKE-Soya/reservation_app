class Users::TimetablesController < ApplicationController
  def edit
    @timetables = Timetable.where(user_id: current_user.id)
  end
  
  def create
    timetable = Timetable.new(timetable_params)
    timetable.user_id = current_user.id
    timetable.save
    redirect_to edit_user_timetable_path
  end
  
  def destroy
    timetable = Timetable.find(params[:id])
    timetable.destroy
    redirect_to edit_user_timetable_path
  end
  
  private
  def timetable_params
    params.require(:timetable).permit(:day_of_week, :period)
  end
end