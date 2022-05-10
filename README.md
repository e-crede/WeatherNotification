# Weather Notifications

## Overview
Application that queries https://api.weather.gov and based on GPS coordinates sends out daily extreme weather  notifications to configured users/drivers

## Assumptions & Limitations
* Driver credentials and their GPS coordinates are seeded in the database - there's no UI or backend service to populate the information, rails console needs to be used
* API requests are executed synchronously and there's No throttling
* The overall application workflow is simplified - no or limited edge cases handling
* No automatic test cases - workflow tested manually

## Deployment
- clone repository
    - git clone https://github.com/e-crede/WeatherNotification.git
- cd into repository dir and Install dependencies
    - bundle install
- Migrate database
    - rails db:migrate
- Seed database with dummy driver details & gps location data
    - rails db:seed 
- launch application
    - rails s
- Backend routines are executed on two conditions
    - Schedulled every hour
    - on demand after launching localhost:3000

## Workflow 
- After launching the server weather events check can be invoked in two ways:
    1. Manually - by opening localhost:3000
    2. Automatically - by a scheduler launched every hour
- Once the backend job is invoked it:
    - Retrieves last known gps coordinates of all the drivers
    - Checks in which state and time zone individuals drivers are
    - Checks if it's morning where the driver is
        - Note: Check is done only if the job is invoked as a schedulled task
    - Retrieves Weather warnings for the state
        - Severe and Extreme warnings are also stored in db for event-logging purposes 
    - Sends out email notifications if there are significant weather events present


