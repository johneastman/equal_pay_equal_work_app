class ComplaintsController < ApplicationController
    def index
        @contact_info = ContactInfo.all
    end
end
