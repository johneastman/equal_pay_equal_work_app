class EmployersController < ApplicationController
  def index
		@employers = Employer.all
  end

	def show
		@employer = Employer.find(params[:id])
		@complaints = @employer.complaints
	end
end
