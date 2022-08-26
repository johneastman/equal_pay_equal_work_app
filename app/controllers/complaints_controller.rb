class ComplaintsController < ApplicationController
    def index
        @complaints = Complaint.all
    end

    def show
        @complaint = Complaint.find(params[:id])
    end

    def edit
        @complaint = Complaint.find(params[:id])
    end

    def update
        @complaint = Complaint.find(params[:id])
        @complaint.update(complaint_params)
        redirect_to complaint_path
    end

    def new
        @complaint = Complaint.new
    end

    def create
        @complaint = Complaint.create(complaint_params)
        redirect_to complaints_path
    end

    def destroy
        @complaint = Complaint.find(params[:id])
        @complaint.destroy
        redirect_to complaints_path, status: :see_other
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
end
