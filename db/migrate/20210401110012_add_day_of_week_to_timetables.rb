class AddDayOfWeekToTimetables < ActiveRecord::Migration[5.2]
  def change
    add_column :timetables, :day_of_week, :integer
  end
end
