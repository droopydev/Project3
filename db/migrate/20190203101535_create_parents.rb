class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.string :salutation
      t.string :name
      t.integer :contact_no

      t.timestamps
    end
  end
end















