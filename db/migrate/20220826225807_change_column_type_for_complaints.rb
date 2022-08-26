class ChangeColumnTypeForComplaints < ActiveRecord::Migration[7.0]
  def change
    change_column :employers, :zipcode, :string
  end
end
