module ComplaintsHelper
	def display_boolean(bool)
		if bool
			return "Yes"
    end
    "No"
  end

  def users_complaint?(current_user, complaint_user)
    return !current_user.nil? && current_user == complaint_user
  end
end
