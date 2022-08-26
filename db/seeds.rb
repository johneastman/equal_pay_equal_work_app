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
			complaint.compensation_description = get_paragraphs
		end

		if history
			complaint.supporting_documentation = get_paragraphs
		end

		complaint.employer = employer

		complaint.save
	end
end
