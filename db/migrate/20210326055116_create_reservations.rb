class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.string :name
      t.integer :period
      t.date :date

      t.timestamps
    end
  end
end
