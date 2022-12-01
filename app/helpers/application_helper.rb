module ApplicationHelper
  
  def welcome_display(user)
    message = "Welcome"
    if !user.nil? && user.first_name.present?
      message += ", #{user.first_name}!"
    else
      message += "!"
    end
    return message
  end
end
