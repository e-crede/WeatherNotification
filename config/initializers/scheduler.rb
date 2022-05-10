require 'rufus-scheduler'

return if defined?(Rails::Console) || Rails.env.test? || File.split($PROGRAM_NAME).last == 'rake'
return if $PROGRAM_NAME.include?('spring')

s = Rufus::Scheduler.singleton

s.cron '0 * * * *' do
  Rails.logger.info "Executing schedulled jobs at #{Time.now}"
  WeatherNotificationJob.perform_later(check_morning = true)
  Rails.logger.flush
end