module ApplicationHelper
  def welcome_display
    message = "Welcome"
    if !current_user.nil? && current_user.first_name.present?
      message += ", #{current_user.first_name}!"
    else
      message += "!"
    end
    return message
  end
end
