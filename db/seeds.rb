# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

def get_paragraphs
	Faker::Lorem.paragraphs(number: 2).join("\n\n")
end

user = User.create(
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	mailing_address: Faker::Address.street_address,
	city: Faker::Address.city,
	state: Faker::Address.state_abbr,
	zipcode: Faker::Address.zip,
	primary_phone: Faker::PhoneNumber.phone_number,
	alt_phone: Faker::PhoneNumber.phone_number,
	email: "test_user@example.com",
	preferred_contact: ["Mail", "Phone", "Email"].sample,
	password: "1234"
)

3.times do |n|
  employer = Employer.create(
		name: Faker::Company.name,
		contact_person_name: Faker::Name.name,
		mailing_address: Faker::Address.street_address,
		city: Faker::Address.city,
		state: Faker::Address.state_abbr,
		zipcode: Faker::Address.zip,
		phone_number: Faker::PhoneNumber.phone_number,
		email_address: Faker::Internet.email,
		website: Faker::Internet.url
	)

	rand(5).times do |n|
		complaint = Complaint.new

		promotional_opportunities = Faker::Boolean.boolean
		complaint.promotional_opportunities = promotional_opportunities
		if promotional_opportunities
			complaint.promotional_opportunities_description = get_paragraphs
		end

		compensation = Faker::Boolean.boolean
		complaint.compensation = compensation
		if compensation
			complaint.compensation_description = get_paragraphs
		end

		history = Faker::Boolean.boolean
		complaint.history = history
		if history
			complaint.history_description = get_paragraphs
		end

		if Faker::Boolean.boolean
			complaint.supporting_documentation = get_paragraphs
		end

		complaint.save

		user_ref = UserReference.create(
			user: user,
			employer: employer,
			complaint: complaint
		)
	end
end
