class CreateDriverLocationLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :driver_location_logs do |t|
      t.references :driver, null: false, foreign_key: true
      t.string :gps_coordinates

      t.timestamps
    end
  end
end
