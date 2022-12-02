class CreateUserReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :user_references do |t|
      t.references :user, null: false, foreign_key: true
      t.references :employer, null: false, foreign_key: true
      t.references :complaint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
