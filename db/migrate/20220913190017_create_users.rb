class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mailing_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :primary_phone
      t.string :alt_phone
      t.string :email
      t.string :preferred_contact

      t.timestamps
    end
  end
end
