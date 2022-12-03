module EmployersHelper
  def get_value(employer, field)
    return if employer.nil?
    
    return employer.attributes[field]
  end
end
