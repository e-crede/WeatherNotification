class WeatherNotificationJob < ApplicationJob
  queue_as :default

  def perform(check_morning)
    Driver.all.each do |driver|
      last_location = DriverLocationLog.where(driver: driver).last
      state, timezone = get_state(last_location.gps_coordinates)
      get_weather_warnings(state, driver) if morning?(timezone, check_morning)
      send_notification(driver)
    end
  end

  private

  # Gets USA State from GPS coordinates
  # TODO: migrate to a service (for now left in job due to requirements simplicity)
  def get_state(location)
    # TODO: unexpected resp. handling
    response = Faraday.get("https://api.weather.gov/points/#{location}")
    response = JSON.parse(response.body)
    logger.debug "Weather API response body: #{response}"
    state = response['properties']['relativeLocation']['properties']['state']
    timezone = response['properties']['timeZone']
    [state, timezone]
  end

  # Notifications should only be sent in mornings, thus 'local' morning time has to checked
  # Check is skipped in case check_morning = false (i.e. job launched via web call)
  def morning?(timezone, check_morning)
    return true unless check_morning

    # TODO: 'morning' hour should be configurable per driver
    Time.now.in_time_zone(timezone) == 8
  end

  # Saves severe weather events into DB
  def parse_weather_warnings(response, state, driver)
    response['features'].each do |warning|
      area_desc = warning['properties']['areaDesc']
      headline = warning['properties']['headline']
      description = warning['properties']['description']
      instruction = warning['properties']['instruction']
      effective = warning['properties']['effective']
      expires = warning['properties']['expires']
      severity = warning['properties']['severity']
      if severity == 'Severe' || severity == 'Extreme'
        logger.debug "Notable weather Event. Driver: #{driver.id}, Severity: #{severity}"
        WeatherStatus.create(
          driver: driver,
          state: state,
          areaDesc: area_desc,
          headline: headline,
          description: description,
          instruction: instruction,
          effective: effective,
          expires: expires,
          severity: severity,
          notified: false
        )
      end
    end
  end

  # Retrieves Weather warnings from weather.gov API
  # TODO: migrate to a service (for now left within job due to requirements simplicity)
  def get_weather_warnings(state, driver)
    response = Faraday.get("https://api.weather.gov/alerts/active?area=#{state}")
    response = JSON.parse(response.body)
    return unless response['features'].count.positive?

    parse_weather_warnings(response, state, driver)
  end

  # Invokes ActiveMailer & sends email
  # TODO: Review job workflow: within mailer Email will be generated only for objects that have 'notified == false',
  #       hence no additional code is needed within this job to see if there were any 'severe' warnings.
  #       Though, for scaled implementations some Performance analysis should be done.
  def send_notification(driver)
    NotificationsMailer.weather_email(driver).deliver_later
  end
end
