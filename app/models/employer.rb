class Employer < ApplicationRecord
	has_many :user_references, dependent: :destroy
	has_many :complaints, through: :user_references

	validates :name, :contact_person_name, :mailing_address, :city, :state, :zipcode, :phone_number, :email_address, :website, presence: true

	def self.existing(employer)
		# Checks if a given employer object already exists in the database. If a row is found, return that object; otherwise,
		# return nil.
		Employer.where([
			"name = ? AND contact_person_name = ? AND mailing_address = ? AND city = ? AND state = ? AND zipcode = ? AND phone_number = ? AND email_address = ? AND website = ?",
			employer.name,
			employer.contact_person_name,
			employer.mailing_address,
			employer.city,
			employer.state,
			employer.zipcode,
			employer.phone_number,
			employer.email_address,
			employer.website
		]).first
	end
end
