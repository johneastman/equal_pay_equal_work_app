class RemoveUserFromComplaints < ActiveRecord::Migration[7.0]
  def change
    remove_reference :complaints, :user, null: false, index: true
    remove_reference :complaints, :employer, null: false, index: true
    
    remove_column :complaints, :user, :integer
  end
end
