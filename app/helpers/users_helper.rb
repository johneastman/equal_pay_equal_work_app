module UsersHelper
  def address_present?(mailing_address, city, state, zipcode)
    return mailing_address.present? && city.present? && state.present? && zipcode.present?
  end

  def display_info(label, values)
    # If all the values in 'values' are present, return this string:
    #   <strong>{label}: </strong>{values[0], values[1], ... values[n]}<\br>
    # Otherwise, nothing is returned. This ensures that only populated data is displayed.
    if values.all? { |t| t.present? }
      return sanitize(content_tag(:strong, "#{label}: ") + values.join(", ") + tag(:br))
    end
  end
end
