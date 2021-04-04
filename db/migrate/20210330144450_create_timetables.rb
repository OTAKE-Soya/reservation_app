class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.integer :user_id
      t.integer :period

      t.timestamps
    end
  end
end
