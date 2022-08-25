class DropContactInfoTable < ActiveRecord::Migration[7.0]
  def change
    def up
      drop_table :contact_info
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
