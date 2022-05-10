require "rails_helper"

# Just a rudimentary sample to confirm that basic rspec setup is valid
RSpec.describe WeatherNotificationJob, :type => :job do
  describe "#perform_later" do
    it "queries weather api" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        WeatherNotificationJob.perform_later(false)
      }.to have_enqueued_job
    end
  end
end