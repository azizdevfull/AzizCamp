class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications, if: :current_user

  private

  def set_notifications
    notifications = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
  end
  # before_action :set_user_time_zone
  # around_action :set_user_time_zone, if: :current_user

# private 

# def set_user_time_zone
#   Time.use_zone(current_user.time_zone) { yield }
# end

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  attr_writer :email

  def email
    @email || self.username || self.email
  end

  # def set_user_time_zone
  #   Time.zone = current_user.time_zone if user_signed_in?
  # end
# private

# def set_user_time_zone
#   Time.zone = current_user.time_zone if user_signed_in?
# end
end
