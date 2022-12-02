class AddUserToComplaint < ActiveRecord::Migration[7.0]
  def change
    add_reference :complaints, :user, index: true
  end
end
