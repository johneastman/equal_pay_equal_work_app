class Complaint < ApplicationRecord
	belongs_to :employer
	belongs_to :user

	validates :user, presence: true
end
