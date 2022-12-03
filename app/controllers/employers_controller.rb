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
		@employer = Employer.new(employer_params)

		result = Employer.existing(@employer)
	
		if result.nil?
			if @employer.save
				redirect_to new_employer_complaint_path(@employer)
			else
				render :new, status: :unprocessable_entity
			end
		else			
			# Redirect to complaint form for this employer
			redirect_to new_employer_complaint_path(result)
		end
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
		# require(:employer).
		params.permit(
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
