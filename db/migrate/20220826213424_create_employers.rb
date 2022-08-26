class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :contact_person_name
      t.string :mailing_address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :phone_number
      t.string :email_address
      t.string :website

      t.timestamps
    end

    add_reference :complaints, :employer, null: false, foreign_key: true
  end
end
