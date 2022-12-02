class EmployersController < ApplicationController
  def index
		@employers = Employer.all		
  end

	def show
		@employer = Employer.find(params[:id])
		@complaints = @employer.complaints
	end

	def new
		# If the user is filing a complaint against an existing employer, populate the
		# employer fields with that employer's data. Otherwise, the form fields will
		# remain blank.
		if !params[:employer_id].nil?
			@employer = Employer.find(params[:employer_id])
		else
			@employer = Employer.new
		end
	end

	def create
		# Check if the employer object is already in the database. If it is not, save the object
		# to the employer table.
		employer = Employer.new(employer_params)

		result = Employer.where([
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

		if result.nil?
			employer.save
		end
		fail
		user_id = employer.id

		redirect_to employers_path
	end

	def edit
		@employer = Employer.find(params[:id])
	end

	def update
		employer = Employer.find(params[:id])
		employer.update(employer_params)
		redirect_to employer_path(employer)
	end

	private

	def employer_params
		params.require(:employer).permit(
			:name,
			:contact_person_name,
			:mailing_address,
			:city,
			:state,
			:zipcode,
			:phone_number,
			:email_address,
			:website
		)
	end
end
