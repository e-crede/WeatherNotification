class NotificationsMailer < ApplicationMailer
  default from: 'notifications@localhost.com'
  after_action :update_notified_status

  # Sends a single email to driver with all weather events that the driver has not been notified about so far
  def weather_email(driver)
    @driver = driver
    @weather_statuses = WeatherStatus.where(driver: driver, notified: false)
    logger.debug "Driver #{@driver.id} has #{@weather_statuses.count} notification(s)"
    return unless @weather_statuses.count.positive?

    mail(to: @driver.email, subject: 'Today\'s Weather Warnings!')
  end

  private

  # Sets notified flag, to avoid resending emails for same events twice
  def update_notified_status
    @weather_statuses.update_all(notified: true)
  end
end
