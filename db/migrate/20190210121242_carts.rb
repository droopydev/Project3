class Carts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :course_id
      t.integer :centre_id
      t.references :parent
      t.timestamps
    end
  end
end
