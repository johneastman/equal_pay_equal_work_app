module UsersHelper

  def display_info(label, values, sep=", ")
    # If all the values in 'values' are present, return this string:
    #   <strong>{label}: </strong>{values[0], values[1], ... values[n]}<\br>
    # Otherwise, nothing is returned. This ensures that only populated data is displayed.
    #
    # Specify a separator for the values (e.g., using a comma for addresses but spaces for names).
    # The default value is a comma.
    if values.all? { |t| t.present? }
      return sanitize(content_tag(:strong, "#{label}: ") + values.join(sep) + tag(:br))
    end
  end
end
