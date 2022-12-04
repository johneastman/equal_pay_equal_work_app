module ApplicationHelper
  
  def welcome_display(user)
    if user.nil? || !user.first_name.present?
      return I18n.t("header.welcome")
    end
    return I18n.t("header.welcome_name", first_name: user.first_name)
  end
end
