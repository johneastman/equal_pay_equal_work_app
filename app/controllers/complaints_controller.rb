require "fillable-pdf"

class ComplaintsController < ApplicationController

	before_action :set_employer
	before_action :require_signin, only: [:generate_complaint, :new]

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
		complaint.user = current_user
		complaint.save
		redirect_to employer_complaint_path(@employer, complaint)
	end

	def destroy
		@complaint = Complaint.find(params[:id])
		@complaint.destroy
		redirect_to employer_path(@employer), status: :see_other
	end

	def generate_complaint
		user = current_user
		employer = Employer.find(params[:employer_id])
		complaint = Complaint.find(params[:id])

		assets_directory = "#{Rails.root}/app/assets"
		complaint_form_filename = "Equal_Pay_Complaint_Form_Dec_2020_Distributed.pdf"
		complaint_form_path = "#{assets_directory}/#{complaint_form_filename}"

		filename = "complaint.pdf"

		# Populate PDF form
		pdf = FillablePDF.new(complaint_form_path)

		fields = {
			:"First Name" => user.first_name,
			:"Last Name" => user.last_name,
			:"Mailing Address" => user.mailing_address,
			:City => user.city,
			:State => user.state,
			:"Zip Code" => user.zipcode,
			:"Primary Phone" => user.primary_phone,
			:"Alternate Phone" => user.alt_phone,
			:"Email Address" => user.email,
			:"Employer Name"=>"",
			:"Employer Contact Person Name"=>"",
			:"Employer Mailing Address"=>"",
			:City_2=>"",
			:State_2=>"",
			:"Zip Code_2"=>"",
			:"Employer Phone Number"=>"",
			:"Employer Email Address"=>"",
			:"Employer website"=>"",
			:"Check Box11" => "Off",  # Preferred Contact Method: Mail
			:"Check Box12" => "Yes",  # Preferred Contact Method: Phone
			:"Check Box13" => "Off",  # Preferred Contact Method: Email
			:"Section III Description of the Alleged Equal Pay for Equal Work Act Part 2 Violation Please check and complete the boxes that apply and provide an explanation of what happened 1 Did the employer fail to notify all current employees of a promotional opportunity CRS  852011 including a failure to include all required information in a notice or failure to provide the notice in time for employees to apply for the position  Yes No If yes please explain"=>"",
			:"2 Did the employer fail to include compensation and a description of benefits in a job posting CRS  852012 including a failure to provide an accurate and positionspecific compensation and benefits description Yes No If yes please explain"=>"", :"3 Did the employer fail to keep records of employee job description and wage history for at least two years after an employees employment CRS  85202 Yes No If yes please explain"=>"",
			:"Check Box14"=>"",
			:"Check Box15"=>"",
			:"Check Box16"=>"",
			:"Check Box17"=>"",
			:"Check Box18"=>"",
			:"Check Box19"=>"",
			:"Section IV Supporting Documentation Please attach to the complaint form You should provide the Division with relevant documentation to support your complaint by attaching it to this complaint form Supporting documentation may include a copy photo or screenshot of a noncompliant job posting or notice of promotional opportunity correspondence with your employer or others concerning a promotional opportunity hire or promotion andor correspondence with your employer or others concerning employee records If you do not have supporting documentation describe in detail any additional information for your allegation that this employer has violated Part 2 of the Equal Pay for Equal Work Act"=>"",
			:"Name or Anonymous"=>"",
			:Date=>"",
			:Text20=>""
		}

		new_complaint_form_path = "#{assets_directory}/#{filename}"
		pdf.set_fields(fields)
		pdf.save_as(new_complaint_form_path)
		pdf.close()

		send_file(
			new_complaint_form_path,
			filename: filename,
			type: "application/pdf",
			disposition: "inline"
		)
	end

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
