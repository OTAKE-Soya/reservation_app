class Users::UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @timetables = Timetable.where(user_id: @user.id)
  end

  def edit
  end
end
