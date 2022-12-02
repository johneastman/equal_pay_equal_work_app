class UserReference < ApplicationRecord
  belongs_to :user
  belongs_to :employer
  belongs_to :complaint

  def self.user_employers(user)
    employers = []
    where(["user_id = ?", user.id]).group(:employer_id).each do |u|
      employers.append(u.employer)
    end
    employers
  end

  def self.user_employer_complaint(user, employer, complaint_id)
    find_by(user_id: user.id, employer_id: employer.id, complaint_id: complaint_id).complaint
  end
end
