class ComplaintsController < ApplicationController
    def index
        @contacts = ContactInfo.all
    end

    def show
        @contact = ContactInfo.find(params[:id])
    end

    def edit
        @contact_info = ContactInfo.find(params[:id])
    end

    def update
        @contact = ContactInfo.find(params[:id])

        @contact.update(contact_params)
        redirect_to complaint_path(@contact)
    end

    private

    def contact_params
        params.require(:contact_info).permit(:first_name, :last_name, :mailing_address)
    end
end
