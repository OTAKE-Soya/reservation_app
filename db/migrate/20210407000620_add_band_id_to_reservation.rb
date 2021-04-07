class AddBandIdToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :band_id, :integer
  end
end
