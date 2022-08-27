class EmployersController < ApplicationController
  def index
		@employers = Employer.all
  end

	def show
		@employer = Employer.find(params[:id])
		@complaints = @employer.complaints
	end

	def new
		@employer = Employer.new
	end

	def create
		employer = Employer.new(employer_params)
		employer.save
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
