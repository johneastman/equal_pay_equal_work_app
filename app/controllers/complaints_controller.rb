class ComplaintsController < ApplicationController

	before_action :set_employer

	def show
		@complaint = @employer.complaints.find(params[:id])
	end

	def edit
		@complaint = Complaint.find(params[:id])
	end

	def update
		@complaint = Complaint.find(params[:id])
		@complaint.update(complaint_params)
		redirect_to employer_complaint_path(@employer, @complaint)
	end

	def new
		@complaint = Complaint.new
	end

	def create
		complaint = @employer.complaints.new(complaint_params)
		complaint.save
		redirect_to employer_complaint_path(@employer, complaint)
	end

	def destroy
		@complaint = Complaint.find(params[:id])
		@complaint.destroy
		redirect_to employer_complaints_path(@employer), status: :see_other
	end

	def generate_complaint
		user = current_user
		employer = Employer.find(params[:employer_id])
		complaint = Complaint.find(params[:id])

		# TEMPORARY
		filename = "random.txt"
		File.open(filename, "w") do |f|
			f.write("Your random number is #{rand(10)}")
		end

		# TODO: Populate PDF form and download

		send_file(
			"#{Rails.root}/#{filename}",
			filename: filename,
			type: "text/plain",
		)
	end
	helper_method :generate_complaint

	private 

	def complaint_params
		params.require(:complaint).permit(
			:promotional_opportunities,
			:promotional_opportunities_description,
			:compensation,
			:compensation_description,
			:history,
			:history_description,
			:supporting_documentation
		)
	end

	def set_employer
		@employer = Employer.find(params[:employer_id])
	end
end
