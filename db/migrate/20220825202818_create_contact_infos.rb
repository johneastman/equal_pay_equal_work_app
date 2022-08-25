class CreateContactInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_infos do |t|

      t.string :first_name
      t.string :last_name
      t.string :mailing_address

      t.timestamps
    end
  end
end
