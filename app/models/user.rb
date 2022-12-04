class User < ApplicationRecord
  has_secure_password

  before_save :default_values

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  
  def default_values
    # The email is required for login, so this value should initially be set to "Email". The user can change
    # this later when/if they add additional contact information.
    self.preferred_contact ||= I18n.t("users.form.preferred_contact_methods.email")
  end
end
