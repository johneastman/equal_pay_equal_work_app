module ComplaintsHelper
	def display_boolean(bool)
		if bool
			return I18n.t("main.boolean_display.yes")
    end
    return I18n.t("main.boolean_display.no")
  end
end
