# Preview all emails at http://localhost:3000/rails/mailers/notifications_mailer
class NotificationsMailerPreview < ActionMailer::Preview
    def weather_email
      NotificationsMailer.weather_email(1).deliver_later
    end
end
