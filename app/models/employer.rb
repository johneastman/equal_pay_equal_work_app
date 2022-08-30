class Employer < ApplicationRecord
	has_many :complaints

	validates :name, :contact_person_name, :mailing_address, :city, :state, :zipcode, :phone_number, :email_address, :website, presence: true
end
