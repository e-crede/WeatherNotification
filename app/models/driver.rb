class Driver < ApplicationRecord
  has_many :driver_location_logs
  has_many :weather_statuses
end
