class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|

      t.boolean :promotional_opportunities
      t.text :promotional_opportunities_description

      t.boolean :compensation
      t.text :compensation_description

      t.boolean :history
      t.text :history_description

      t.text :supporting_documentation

      t.timestamps
    end
  end
end
