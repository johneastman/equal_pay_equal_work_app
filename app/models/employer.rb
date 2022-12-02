class Employer < ApplicationRecord
	has_many :user_references, dependent: :destroy
	has_many :complaints, through: :user_references

	validates :name, :contact_person_name, :mailing_address, :city, :state, :zipcode, :phone_number, :email_address, :website, presence: true
end
