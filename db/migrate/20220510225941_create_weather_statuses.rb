class CreateWeatherStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_statuses do |t|
      t.references :driver, null: false, foreign_key: true
      t.string :state
      t.string :areaDesc
      t.string :headline
      t.string :description
      t.string :instruction
      t.date :effective
      t.date :expires
      t.string :severity
      t.boolean :notified

      t.timestamps
    end
  end
end
