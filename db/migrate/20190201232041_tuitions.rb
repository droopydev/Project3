class Tuitions < ActiveRecord::Migration[5.2]
  def change
    create_table :tuitions do |t|
      t.string :company_id
      t.string :company_name
      t.text :reg_no
      t.integer :contact_no
      t.text :location
      t.text :description
      
      t.timestamps
    end
  end
end
