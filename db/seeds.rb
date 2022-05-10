# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Driver.create(first_name: "John", last_name: "Smith", email: "John.Smith@localhost.com")
Driver.create(first_name: "Max", last_name: "Mustermann", email: "Max.Mustermann@localhost.com")
Driver.create(first_name: "Luke", last_name: "Skywalker", email: "Luke.Skywalker@localhost.com")
Driver.create(first_name: "Tom", last_name: "Dooley", email: "Tom.Dooley@localhost.com")


DriverLocationLog.create(driver_id: 1, gps_coordinates: "26.1458,-80.5143")
DriverLocationLog.create(driver_id: 1, gps_coordinates: "26.1474,-80.7049")
DriverLocationLog.create(driver_id: 1, gps_coordinates: "26.1494,-80.6578")

DriverLocationLog.create(driver_id: 2, gps_coordinates: "32.4490,-100.4941")
DriverLocationLog.create(driver_id: 2, gps_coordinates: "32.4551,-99.9036")
DriverLocationLog.create(driver_id: 2, gps_coordinates: "32.4591,-100.0629")

DriverLocationLog.create(driver_id: 3, gps_coordinates: "37.3925,-105.8913")
DriverLocationLog.create(driver_id: 3, gps_coordinates: "37.3925,-105.8913")
DriverLocationLog.create(driver_id: 3, gps_coordinates: "37.3924,-105.8912")

DriverLocationLog.create(driver_id: 4, gps_coordinates: "30.2593,-99.4681")
